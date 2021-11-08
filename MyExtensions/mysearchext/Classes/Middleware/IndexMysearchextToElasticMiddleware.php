<?php

namespace Porthd\Mysearchext\Middleware;

/***************************************************************
 *
 *  Copyright notice
 *
 *  (c) 2021 Dr. Dieter Porth <info@mobger.de>
 *
 *  All rights reserved
 *
 *  This script is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/


use Porthd\Mysearchext\Config\SelfConst;

use Porthd\Mysearchext\Domain\Model\MysearchextData;
use Porthd\Mysearchext\Elasticsearch\Indexer\IndexerInterface;
use Porthd\Mysearchext\Utilities\ConfigurationUtility;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;


use TYPO3\CMS\Core\Http\JsonResponse;
use TYPO3\CMS\Core\Http\Stream;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Frontend\Controller\ErrorController;

/**
 * Class ResourcesForFrontendEditing
 * This extension add some needed styles and javascript-codes to the rendered page
 */
class IndexMysearchextToElasticMiddleware implements MiddlewareInterface
{

// mainly develeped by  https://www.glohbe.de/de/elasticsearch-mit-php/ (german explainatiuon about elasticSearch with PHP)

    /**
     * @var array $indexerList
     */
    protected $indexerList = [];

    /**
     * @param ServerRequestInterface $request
     * @param RequestHandlerInterface $handler
     * @return ResponseInterface
     * @throws \TYPO3\CMS\Core\Error\Http\ServiceUnavailableException
     */
    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {

        $testDomain = getenv(SelfConst::ELASTIC_INDEX_DOMAIN_NAME) ?: SelfConst::ELASTIC_INDEX_DOMAIN_VALUE;
        $testSubRoute = getenv(SelfConst::ELASTIC_INDEX_SUB_NAME) ?: SelfConst::ELASTIC_INDEX_SUB_VALUE;
        if ((trim($_SERVER['HTTP_HOST'], DIRECTORY_SEPARATOR) === $testDomain) &&
            (trim($_SERVER['REQUEST_URI'], DIRECTORY_SEPARATOR) === $testSubRoute)) {
            /** @var Stream $bodyStraet */
            $bodyStraet = $request->getBody();
            $myJson = $bodyStraet->getContents();
            $this->indexerList = ConfigurationUtility::extractCustomClassesForExtension(
                SelfConst::SELF_NAME,
                SelfConst::GLOBALS_SUBKEY_CUSTOMINDEXER,
                SelfConst::GLOBALS_SUBKEY_EXCLUDEINDEXER,
                IndexerInterface::class
            );
            if (!empty($this->indexerList)) {
                $flagSeparatedIndexing = false;
                /** @var array $insertData */
                $insertData = [];
                $insertData['orig'] = $myJson;
                $insertData['list'] = json_decode($myJson, true);
                if ($flagSeparatedIndexing) {
                    $errorList = [];
                    $rawUrls = [];
                    /** @var IndexerInterface $indexerObject */
                    foreach ($this->indexerList as $indexerObject) {
                        $indexerObject->makeDataModelExtend($insertData);
                        $flagIndex = true;
                        $flagBasicContained = true;
                        foreach ($indexerObject->getNeededRawData() as $requestKey) {
                            $flagBasicContained = $flagBasicContained && (isset($insertData['list'][$requestKey]));
                        }
                        if ($flagBasicContained) {
                            // the indexerlist contains only the
                            $flagFlow = true;
                            $flagFlow = $flagFlow && $indexerObject->normalizeRequest($insertData);
                            $flagFlow = $flagFlow && $indexerObject->rebuildRequest($insertData);

                            if ($flagFlow) {
                                // each indexer will store the error itself in the object. the errors mus be requested later
                                $params = [
                                    SelfConst::INDEXER_BASIC_INDEX => $indexerObject->indexName($insertData) ?? SelfConst::ADDON_BASIC_INDEXNAME,
                                    SelfConst::INDEXER_BASIC_TYPE_KEY => $indexerObject->typeName($insertData) ?? SelfConst::ADDON_BASIC_TYPE_NAME,
                                    'id' => $indexerObject->idName($insertData) ?? hash(
                                        'sha512',
                                        SelfConst::SELF_NAME . $myJson . SelfConst::SELF_NAME .
                                        SelfConst::ADDON_BASIC_INDEXNAME
                                    ),
                                    'body' => $indexerObject->bodyList($insertData['list']) ?? SelfConst::ADDON_BASIC_DUMMYDATA,
                                ];
                                try {
                                    // Alles hat geklappt
                                    if (($flagIndex = ($flagIndex && $indexerObject->insert($params))) !== true) {
                                        $errorList[] = $indexerObject->selfName() . ' error while inserting the parameter:' . "\n" .
                                            json_encode($params) . "\n" . "\n";

                                    };
                                    $rawUrls[] = $indexerObject->getUrls($insertData) ?? [];
                                } catch (\Exception $e) {
                                    // Speichern fehlgeschlagen
                                    $errorList[] = $indexerObject->selfName() . ' Exception:' . $e->getMessage();
                                }
                            } else {
                                $list = $indexerObject->getErrorMessages() ?? [];
                                $errorList[] = $indexerObject->selfName() . ' error in normalize or rebuild:' . "\n" .
                                    implode('\n ', $list) . "\n" . "\n";
                            }
                        } else {
                            $errorList[] = $indexerObject->selfName() . ' Missing Parameters:' . print_r($insertData,
                                    true);
                        }
                    }

                    if (!empty($errorList)) {
                        return GeneralUtility::makeInstance(ErrorController::class)
                            ->unavailableAction(
                                $request,
                                'The request could not fully be solved. The workflow has the following infos.' .
                                print_r($insertData,
                                    true) . "\n" .
                                (empty($errorList) ? '' : 'errorMessages' . "\n" . implode("\n",
                                        $errorList) . "\n")
                            );
                    }
                    $urls = [];
                    foreach ($rawUrls as $urlsList) {
                        foreach ($urlsList as $item) {
                            if (!empty($item)) {
                                $urls[] = $item;
                            }
                        }
                    }

                } else { // $flagSeparatedIndexing
                    foreach ($this->indexerList as $indexerObject) {
                        $indexerObject->makeDataModelExtend($insertData);
                    }
                    $flagIndex = true;
                    $flagFlow = false;

                    if ($flagBasicContained = $this->containExpectedParam($insertData)) {


                        // the indexerlist contains only the
                        $flagFlow = true;
                        // parameter $insertData by referenz, because the method can change the appearance of the data
                        $flagFlow = $flagFlow && $this->normalizeData($insertData);
                        $flagFlow = $flagFlow && $this->rebuildData($insertData);
                        $flagIndex = $this->buildAndInsertData($insertData);
                    }
                    if (($flagBasicContained === false) ||
                        ($flagFlow === false) ||
                        ($flagIndex === false)
                    ) {
                        $errorMessages = $this->errorMessages($insertData);
                        return GeneralUtility::makeInstance(ErrorController::class)
                            ->unavailableAction(
                                $request,
                                'The request could not be solved. The workflow has the following infos.' .
                                print_r($insertData,
                                    true) . "\n" .
                                (empty($errorMessages) ? '' : 'errorMessages' . "\n" . implode("\n",
                                        $errorMessages) . "\n")
                            );
                    }
                    $urls = $this->urlsData($insertData);
                }
                $answerList = [
                    SelfConst::ADDON_BASIC_STATUS_NAME => 200,

                    SelfConst::ADDON_BASIC_FLAG_RESURF => false,
                    SelfConst::ADDON_BASIC_URI_RESURF => $urls,
                ];

                // Hook after insert informations
                $this->hookAfterSuccessElasticInserts($answerList, $insertData);
                if (($answerList[SelfConst::ADDON_BASIC_FLAG_RESURF] === false) &&
                    (!empty($answerList[SelfConst::ADDON_BASIC_URI_RESURF]))
                ) {
                    $answerList[SelfConst::ADDON_BASIC_URI_RESURF] = [];
                }

                return new JsonResponse($answerList,200);
            }
        }
        return $handler->handle($request);
    }

    /**
     *
     * @todo make smale extract submethods
     *
     * @param array $insertData
     * @return bool
     */
    protected function containExpectedParam(array $insertData): bool
    {
        $flag = true;
        foreach ($this->indexerList ?? [] as $indexerObj) {
            foreach ($indexerObj->getNeededRawData() as $requestKey) {
                $flag = $flag && (isset($insertData['list'][$requestKey]));
            }
        }
        return $flag;
    }

    /**
     * @param $insertData
     * @return bool
     */
    protected function normalizeData(&$insertData)
    {
        return $this->generalFlowData(
            $insertData,
            SelfConst::METHOD_NORMALIZE);
    }

    /**
     * @param $insertData
     * @return bool
     */
    protected function rebuildData(&$insertData)
    {
        return $this->generalFlowData(
            $insertData,
            SelfConst::METHOD_REBUILD);
    }

    /**
     * @param $insertData
     * @param $methodName
     * @return bool
     */
    protected function generalFlowData($insertData, $methodName)
    {
        $flag = true;
        foreach ($this->indexerList as $indexer) {
            $flag = $flag && $indexer->$methodName($insertData);
        }

        return $flag;
    }

    /**
     * @return array
     */
    protected function errorMessages()
    {
        $methodName = SelfConst::METHOD_GET_ERRORMESSAGES;
        $list = [];
        foreach ($this->indexerList as $indexer) {
            foreach ($indexer->$methodName() ?? [] as $item) {
                $list[] = $item;
            }
        }
        return array_filter($list);
    }

    /**
     * @param $insertData
     * @return array
     */
    protected function urlsData($insertData)
    {
        $methodName = SelfConst::METHOD_GET_URLS;
        $list = [];
        foreach ($this->indexerList as $indexer) {
            foreach ($indexer->$methodName($insertData) ?? [] as $item) {
                $list[] = $item;
            }
        }
        return array_filter($list);
    }

    /**
     * @param $insertData
     * @return bool
     */
    protected function buildAndInsertData(&$insertData): bool
    {
        $flagIndex = true;
        foreach ($this->indexerList as $indexer) {
            // each indexer will store the error itself in the object. the errors mus be requested later
            $params = [
                SelfConst::ELASTIC_INDEXER_INDEX => $indexer->indexName($insertData) ?: SelfConst::ADDON_BASIC_INDEXNAME,
                SelfConst::ELASTIC_INDEXER_TYPE  => $indexer->typeName($insertData) ?: SelfConst::ADDON_BASIC_TYPE_NAME,
                SelfConst::ELASTIC_INDEXER_ID  => $indexer->idName($insertData) ?: hash(
                    'sha512',
                    SelfConst::SELF_NAME . json_encode($insertData) . SelfConst::SELF_NAME . SelfConst::ADDON_BASIC_INDEXNAME
                ),
                SelfConst::ELASTIC_INDEXER_BODY  => $indexer->bodyList($insertData) ?: $insertData,
            ];
            try {
                // Alles hat geklappt
                $flagIndex = $flagIndex && $indexer->insert($params);
            } catch (\Exception $e) {
                // Speichern fehlgeschlagen
                $indexer->addErrorMessage('Exception:' . $e->getMessage());
                $flagIndex = $flagIndex && (false);
            }
        }
        return $flagIndex;
    }

    /**
     * @param array $jsonResponse
     * @param array $insertDataByRef
     */
    protected function hookAfterSuccessElasticInserts(array &$jsonResponse, array &$insertDataByRef)
    {
        foreach (
        ($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][SelfConst::SELF_NAME]['messageAfterSuccessElasticInsert'] ?? [])
            as $classRef
        ) {
            $hookObj = GeneralUtility::makeInstance($classRef);
            if (method_exists($hookObj, 'messageAfterSuccessElasticInsert')) {
                $hookObj->messageAfterSuccessElasticInsert($jsonResponse, $insertDataByRef);
            }
        }
    }

}
