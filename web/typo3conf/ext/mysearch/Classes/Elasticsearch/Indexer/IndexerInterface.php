<?php

namespace Porthd\Mysearch\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Domain\Model\DataDocumentInterface;

interface IndexerInterface
{

    public function selfName():string;

    public function makeDataModelExtend():?DataDocumentInterface;

    public function containExpectedParam(array &$fromHttpRequest): bool;


    public function normalizeRequest(array &$request):bool;
    public function extendRequest(array &$request):bool;
    public function reviewRequest(array &$request):bool;
    public function reduceRequest(array &$request):bool;
    public function buildAndInsert(array &$request):bool;

    /**
     * @param $dataParam
     * @param int $flagGeneral if false, the
     * @return mixed
     */
    public function insert($dataParam);

    public function flagRequestToIndex(array $request):bool;


    public function indexName(array &$request):?string;
    public function typeName(array &$request):?string;
    public function idName(array &$request):?string;
    public function contentList(array &$request):array;
}
