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

use Porthd\Mysearchext\Domain\Model\DataDocumentInterface;
use Porthd\Mysearchext\Domain\Model\MysearchextData;
use Porthd\Mysearchext\Elasticsearch\Indexer\IndexerInterface;
use Porthd\Mysearchext\Utilities\ConfigurationUtility;
use Psr\Http\Message\ResponseFactoryInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;

use TYPO3\CMS\Core\Http\JsonResponse;
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
     * @var array
     */
    protected $indexerList = [];

    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {

        $testSubRoute = getenv(SelfConst::ELASTIC_INDEX_ROUTE_NAME) ?? SelfConst::ELASTIC_INDEX_ROUTE_NAME;
        if (trim($request->getAttribute('normalizedParams')->getRequestUri(), DIRECTORY_SEPARATOR) === $testSubRoute) {
            $this->indexerList = ConfigurationUtility::extractCustomClassesForExtension(
                SelfConst::SELF_NAME,
                SelfConst::GLOBALS_SUBKEY_CUSTOMINDEXER,
                SelfConst::GLOBALS_SUBKEY_EXCLUDEINDEXER,
                IndexerInterface::class
            );
            if (!empty($this->indexerList)) {
                $flagSeparatedIndexing = false;
                /** @var MysearchextData $insertData */
                $insertData = GeneralUtility::makeInstance(MysearchextData::class);
                $insertData->orig = $_REQUEST;
                if ($flagSeparatedIndexing) {
                    $errorList = [];
                    $rawUrls = [];
                    /** @var IndexerInterface $indexerObject */
                    foreach ($this->indexerList as $indexerObject) {
                        $insertDummy = clone $insertData;
                        if (($dummy = $indexerObject->makeDataModelExtend()) !== null) {
                            $insertDummy->more = $dummy;
                        }
                        $flagIndex = true;
                        $flagFlow = false;
                        $flagBasicContained = true;
                        foreach ($indexerObject->getNeededRawData() as $requestKey) {
                            $flagBasicContained = $flagBasicContained && (isset($insertData->orig[$requestKey]));
                        }
                        if ($flagBasicContained) {

                            $insertDataList = $insertData->toArray();
                            // the indexerlist contains only the
                            $flagFlow = true;
                            // parameter $insertDataList by referenz, because the method can change the appearance of the data
                            $flagFlow = $flagFlow && $indexerObject->normalizeRequest($insertDataList);
                            $flagFlow = $flagFlow && $indexerObject->rebuildRequest($insertDataList);

                            if ($flagFlow) {
                                // each indexer will store the error itself in the object. the errors mus be requested later
                                $params = [
                                    'index' => $indexerObject->indexName($insertDataList) ?: SelfConst::SELF_NAME,
                                    'type' => $indexerObject->typeName($insertDataList) ?: SelfConst::SELF_DEFAULT_INDEX,
                                    'id' => $indexerObject->idName($insertDataList) ?: hash(
                                        'sha512',
                                        SelfConst::SELF_NAME . json_encode($insertDataList) . SelfConst::SELF_NAME . SelfConst::SELF_DEFAULT_INDEX
                                    ),
                                    'body' => $indexerObject->bodyList($insertDataList) ?: $insertDataList,
                                ];
                                try {
                                    // Alles hat geklappt
                                    $flagIndex = $flagIndex && $indexerObject->insert($params);
                                    $rawUrls[] = $indexerObject->getUrls($insertDataList) ?? [];
                                } catch (\Exception $e) {
                                    // Speichern fehlgeschlagen
                                    $errorList[] = $indexerObject->selfName() . ' Exception:' . $e->getMessage();
                                }
                            } else {
                                $list = $indexerObject->getErrorMessages() ?? [];
                                $errorList[] = $indexerObject->selfName() . ' error in normalitze or rebuild:' . "\n" .
                                    implode('\n ', $list) . "\n" . "\n";
                            }
                        } else {
                            $errorList[] = $indexerObject->selfName() . ' Missing Parameters:' . print_r($insertDataList,
                                    true);
                        }
                    }

                    if (!empty($errorList)) {
                        return GeneralUtility::makeInstance(ErrorController::class)
                            ->unavailableAction(
                                $request,
                                'The request could not fully be solved. The workflow has the following infos.' .
                                print_r($insertDataList,
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
                    $shiftingPointer = $insertData;
                    foreach ($this->indexerList as $indexerObject) {
                        if (($dummy = $indexerObject->makeDataModelExtend()) !== null) {
                            $shiftingPointer->more = $dummy;
                            $shiftingPointer = $shiftingPointer->more;
                        }
                    }
                    $flagIndex = true;
                    $flagFlow = false;

                    if ($flagBasicContained = $this->containExpectedParam($insertData)) {

                        $insertDataList = $insertData->toArray();
                        // the indexerlist contains only the
                        $flagFlow = true;
                        // parameter $insertDataList by referenz, because the method can change the appearance of the data
                        $flagFlow = $flagFlow && $this->normalizeData($insertDataList);
                        $flagFlow = $flagFlow && $this->rebuildData($insertDataList);
                        $flagFlow = $flagFlow && $this->buildAndInsertData($insertDataList);
                    }
                    if (($flagBasicContained === false) ||
                        ($flagFlow === false) ||
                        ($flagIndex === false)
                    ) {
                        $errorMessages = $this->errorMessages($insertDataList);
                        return GeneralUtility::makeInstance(ErrorController::class)
                            ->unavailableAction(
                                $request,
                                'The request could not be solved. The workflow has the following infos.' .
                                print_r($insertDataList,
                                    true) . "\n" .
                                (empty($errorMessages) ? '' : 'errorMessages' . "\n" . implode("\n",
                                        $errorMessages) . "\n")
                            );
                    }
                    $urls = $this->urlsData();

                }
                /** @var JsonResponse $jsonResponse */
                $jsonResponse = new JsonResponse(
                    $urls
                );

                // Hook after insert informations
                $this->hookAfterSuccessElasticInserts($jsonResponse, $insertDataList);

                return $jsonResponse;
            }
        }
        return $handler->handle($request);
    }

    /**
     * @param array $indexerList
     * @param DataDocumentInterface $insertData
     * @return bool
     */
    protected function containExpectedParam(array $indexerList, DataDocumentInterface $insertData): bool
    {
        $flag = true;
        foreach ($this->indexerList ?? [] as $indexerObj) {
            foreach ($indexerObj->getNeededRawData() as $requestKey) {
                $flag = $flag && (isset($insertData->orig[$requestKey]));
            }
        }
        return $flag;
    }

    protected function normalizeData(&$insertDataList)
    {
        return $this->generalFlowData(
            $insertDataList,
            SelfConst::METHOD_NORMALIZE);
    }

    protected function rebuildData(&$insertDataList)
    {
        return $this->generalFlowData(
            $insertDataList,
            SelfConst::METHOD_REBUILD);
    }


    protected function generalFlowData($insertDataList, $methodName)
    {
        $flag = true;
        foreach ($this->indexerList as $indexer) {
            $flag = $flag && $indexer->$methodName($insertDataList);
        }

        return $flag;
    }

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

    protected function urlsData()
    {
        $methodName = SelfConst::METHOD_GET_URLS;
        $list = [];
        foreach ($this->indexerList as $indexer) {
            foreach ($indexer->$methodName() ?? [] as $item) {
                $list[] = $item;
            }
        }
        return array_filter($list);
    }

    protected function buildAndInsertData($indexerList, &$insertDataList): bool
    {
        $flagIndex = true;
        foreach ($indexerList as $indexer) {
            // each indexer will store the error itself in the object. the errors mus be requested later
            $params = [
                'index' => $indexer->indexName($insertDataList) ?: SelfConst::SELF_NAME,
                'type' => $indexer->typeName($insertDataList) ?: SelfConst::SELF_DEFAULT_INDEX,
                'id' => $indexer->idName($insertDataList) ?: hash(
                    'sha512',
                    SelfConst::SELF_NAME . json_encode($insertDataList) . SelfConst::SELF_NAME . SelfConst::SELF_DEFAULT_INDEX
                ),
                'body' => $indexer->bodyList($insertDataList) ?: $insertDataList,
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
     * @param JsonResponse $jsonResponse
     * @param array $insertDataList
     * @return mixed
     */
    protected function hookAfterSuccessElasticInserts($jsonResponse, &$insertDataList)
    {
        foreach (
        ($GLOBALS['TYPO3_CONF_VARS']['EXTCONF']['mysearchext']['messageAfterSuccessElasticInsert'] ?? [])
            as $classRef
        ) {
            $hookObj = GeneralUtility::makeInstance($classRef);
            if (method_exists($hookObj, 'messageAfterSuccessElasticInsert')) {
                $insertDataList = $hookObj->messageAfterSuccessElasticInsert($jsonResponse, $insertDataList);
            }
        }
    }

}
