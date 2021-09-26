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

use Porthd\Mysearch\Domain\Model\IndexerFlowLog;
use Porthd\Mysearch\Elasticsearch\Indexer\IndexerInterface;
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
            $floatLog = new IndexerFlowLog();
            $floatLog->orig = $_REQUEST;
            $flagIndex = true;
            if ($flagBasicContained = $this->containExpectedParam($floatLog)) {
                // the indexerlist contains only the
                if (!empty($indexerList = $this->getInderClasses($floatLog))) {
                    $flagFlow = true;
                    $flagFlow = $flagFlow && $this->normalizeData($floatLog, $indexerList); // $orig=>$normalized;
                    $flagFlow = $flagFlow && $this->extendData($floatLog, $indexerList); // $normalized=>$extended;
                    $flagFlow = $flagFlow && $this->reviewData($floatLog, $indexerList); // $extended=>$reviewed;
                    $flagFlow = $flagFlow && $this->reduceData($floatLog, $indexerList); // $reviewed=>$reduce;
                    $flagIndex = $this->buildData($floatLog, $indexerList); // $reduce=>$builded;
                }

            }
            if ((!$flagBasicContained) ||
                (empty($flagFlow)) ||
                (!$flagIndex)
            ) {
                return GeneralUtility::makeInstance(ErrorController::class)
                    ->unavailableAction(
                        $request,
                        'The request could not be solved. The workflow has the following infos.' . print_r($floatLog,
                            true)
                    );
            }
            $response = $this->responseFactory->createResponse()
                ->withHeader('Content-Type', 'application/json; charset=utf-8');
            $response->getBody()->write(
                json_encode($floatLog->builded)
            );
            return $response;
        }
        return $handler->handle($request);
    }

    protected function containExpectedParam($floatLog): bool
    {
        $flag = true;
        foreach (SelfConst::BASIC_REQUEST_KEY_LIST as $requestKey) {
            $flag = $flag && (isset($floatLog->orig[$requestKey]));
        }
        return $flag;
    }

    protected function normalizeData($floatLog, $indexerList)
    {
        return $this->generalFlowData(
            $floatLog,
            SelfConst::METHOD_NORMALIZE,
            $indexerList);
    }

    protected function extendData($floatLog, $indexerList)
    {
        return $this->generalFlowData(
            $floatLog,
            SelfConst::METHOD_EXTEND,
            $indexerList);
    }

    protected function reviewData($floatLog, $indexerList)
    {
        return $this->generalFlowData(
            $floatLog,
            SelfConst::METHOD_REVIEW,
            $indexerList);
    }

    protected function reduceData($floatLog, $indexerList)
    {
        return $this->generalFlowData(
            $floatLog,
            SelfConst::METHOD_REDUCE,
            $indexerList);
    }

    protected function generalFlowData($floatLog, $methodList, $indexerList)
    {

        $method = $methodList['name'];
        $fromName = $methodList['from'];
        $toName = $methodList['to'];

        $result = [];
        foreach ($indexerList as $indexer) {
            $result[] = $indexer->$method($floatLog->$fromName);
        }
        $floatLog->$toName = array_merge(...$result);
        return (!empty($floatLog->$toName));
    }

    protected function buildData($floatLog, $indexerList)
    {
        $method = SelfConst::METHOD_BUILD['name'];
        $fromName = SelfConst::METHOD_BUILD['from'];
        $toName = SelfConst::METHOD_BUILD['to'];

//        $elasticApi = GeneralUtility::makeInstance(BasicInsert::class);
        $result = [];
        /** @var IndexerInterface $indexer */
        $indexed = [];
        foreach ($indexerList as $indexer) {
            $myIndex = $indexer->indexName($floatLog->$fromName) ?? SelfConst::SELF_NAME;
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
