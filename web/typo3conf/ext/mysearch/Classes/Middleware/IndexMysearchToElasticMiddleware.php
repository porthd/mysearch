<?php

namespace Porthd\Mysearch\Middleware;

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


use Porthd\Mysearch\Config\SelfConst;

use Porthd\Mysearch\Domain\Model\DataDocumentInterface;
use Porthd\Mysearch\Domain\Model\IndexerFlowLog;
use Porthd\Mysearch\Domain\Model\MysearchData;
use Porthd\Mysearch\Elasticsearch\Indexer\IndexerInterface;
use Porthd\Mysearch\Utilities\ConfigurationUtility;
use Psr\Http\Message\ResponseFactoryInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;

use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Frontend\Controller\ErrorController;

/**
 * Class ResourcesForFrontendEditing
 * This extension add some needed styles and javascript-codes to the rendered page
 */
class IndexMysearchToElasticMiddleware implements MiddlewareInterface
{

// mainly develeped by  https://www.glohbe.de/de/elasticsearch-mit-php/ (german explainatiuon about elasticSearch with PHP)

    /** @var ResponseFactoryInterface */
    private $responseFactory;

    public function __construct(ResponseFactoryInterface $responseFactory)
    {
        $this->responseFactory = $responseFactory;
    }


    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {

        $testSubRoute = getenv(SelfConst::ELASTIC_INDEX_ROUTE_NAME) ?? SelfConst::ELASTIC_INDEX_ROUTE_NAME;
        if (trim($request->getAttribute('normalizedParams')->getRequestUri(), DIRECTORY_SEPARATOR) === $testSubRoute) {
            $indexerList = ConfigurationUtility::extractCustomClassesForExtension(
                SelfConst::SELF_NAME,
                SelfConst::GLOBALS_SUBKEY_CUSTOMINDEXER,
                SelfConst::GLOBALS_SUBKEY_CUSTOMRESULTER,
                IndexerInterface::class
            );
            if (!empty($indexerList)) {
                /** @var MysearchData $insertData */
                $insertData = GeneralUtility::makeInstance(MysearchData::class);
                $insertData->orig = $_REQUEST;
                $shiftingPointer = $insertData;
                foreach ($indexerList as $indexerObject) {
                    if (($dummy = $indexerObject->makeDataModelExtend()) !== null) {
                        $shiftingPointer->more = $dummy;
                        $shiftingPointer = $shiftingPointer->more;
                    }
                }
                $flagIndex = true;
                $flagFlow = false;
                if ($flagBasicContained = $this->containExpectedParam($indexerList, $insertData)) {
                    $insertDataList = $insertData->toArray();
                    // the indexerlist contains only the
                    $flagFlow = true;
                    $flagFlow = $flagFlow && $this->normalizeData($indexerList, $insertDataList);
                    $flagFlow = $flagFlow && $this->extendData($indexerList, $insertDataList);
                    $flagFlow = $flagFlow && $this->reviewData($indexerList, $insertDataList);
                    $flagFlow = $flagFlow && $this->reduceData($indexerList, $insertDataList);
                    $flagIndex = $this->buildData($indexerList, $insertDataList);

                }
                if ((!$flagBasicContained) ||
                    (empty($flagFlow)) ||
                    (!$flagIndex)
                ) {
                    $listMessage = $this->errorMessage($indexerList, $insertDataList);
                    return GeneralUtility::makeInstance(ErrorController::class)
                        ->unavailableAction(
                            $request,
                            'The request could not be solved. The workflow has the following infos.' .
                            print_r($insertDataList,
                                true)."\n".
                            (empty($listMessage)?'':implode("\n",$listMessage))
                        );
                }
                $response = $this->responseFactory->createResponse()
                    ->withHeader('Content-Type', 'application/json; charset=utf-8');
                // Hook for respons-Informations
                foreach (
                    ($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][ 'mysearch' ][ 'messageAfterSuccessElasticInsert' ] ??[])
                    as $classRef
                ) {
                    $hookObj = GeneralUtility::makeInstance($classRef);
                    if (method_exists($hookObj, 'messageAfterSuccessElasticInsert')) {
                        $hookObj->messageAfterSuccessElasticInsert($response, $insertDataList);
                    }
                }

                return $response;
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
        foreach ($indexerList ?? [] as $indexerObj) {
            foreach ($indexerObj->getNeededRawData() as $requestKey) {
                $flag = $flag && (isset($insertData->orig[$requestKey]));
            }
        }
        return $flag;
    }

    protected function normalizeData($indexerList, &$insertDataList)
    {
        return $this->generalFlowData(
            $insertDataList,
            SelfConst::METHOD_NORMALIZE,
            $indexerList);
    }

    protected function extendData($indexerList, &$insertDataList)
    {
        return $this->generalFlowData(
            $insertDataList,
            SelfConst::METHOD_EXTEND,
            $indexerList);
    }

    protected function reviewData($indexerList, &$insertDataList)
    {
        return $this->generalFlowData(
            $insertDataList,
            SelfConst::METHOD_REVIEW,
            $indexerList);
    }

    protected function reduceData($indexerList, &$insertDataList)
    {
        return $this->generalFlowData(
            $insertDataList,
            SelfConst::METHOD_REDUCE,
            $indexerList);
    }

    protected function generalFlowData($indexerList, $methodName, &$insertDataList)
    {
        $flag = true;
        foreach ($indexerList as $indexer) {
            $flag = $flag && $indexer->$methodName($insertDataList);
        }

        return $flag;
    }

    protected function errorMessage($indexerList, &$insertDataList)
    {
        $methodName = SelfConst::METHOD_ERRORMESSAGE;
        $list = [];
        foreach ($indexerList as $indexer) {
            $list[] = $indexer->$methodName($insertDataList);
        }
        return array_filter($list);
    }

    protected function buildData($indexerList, &$insertDataList)
    {
        $method = SelfConst::METHOD_BUILD;

        $result = [];
        /** @var IndexerInterface $indexer */
        $indexed = [];
        foreach ($indexerList as $indexer) {
            $myIndex = $indexer->indexName($insertDataList) ?? SelfConst::SELF_NAME;
            if (SelfConst::SELF_NAME !== strtolower($myIndex)) {
                $buildBody = $indexer->$method($floatLog->$fromName);
                $params = [
                    'index' => $myIndex,
                    'type' => $indexer->typeName($buildBody) ?? SelfConst::SELF_NAME,
                    'id' => $indexer->idName($buildBody) ?? hash('sha512', json_encode($buildBody)),
                    'body' => $buildBody,
                ];
                try {
                    // Alles hat geklappt
                    $indexed[] = $indexer->insert($params);
                } catch (\Exception $e) {
                    // Speichern fehlgeschlagen
                    $floatLog->$toName = array_merge(...$indexed);
                    return false;
                }
            }
            $result[] = $indexed;
        }
        $buildBody = array_merge($result[]);
        $params = [
            'index' => SelfConst::SELF_NAME,
            'type' => SelfConst::SELF_NAME,
            'id' => $indexer->idName($buildBody) ?? hash(
                    'sha512',
                    SelfConst::SELF_NAME . json_encode($buildBody) . SelfConst::SELF_NAME
                ),
            'body' => $buildBody,
        ];
        try {
            // Alles hat geklappt
            $indexed[] = $indexer->insert($params);
        } catch (\Exception $e) {
            // Speichern fehlgeschlagen
            $floatLog->$toName = array_merge(...$indexed);
            return false;
        }
        $floatLog->$toName = array_merge(...$indexed);
        return (!empty($floatLog->$toName));
    }

}
