<?php

namespace Porthd\Mysearch\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Domain\Model\InsertInterface;

interface IndexerInterface
{

    public function selfName():string;

    /**
     * @param $dataParam
     * @param int $flagGeneral if false, the
     * @return mixed
     */
    public function insert($dataParam);

    public function flagRequestToIndex(array $request):bool;

    public function normalizeRequest(array $request):array;
    public function extendRequest(array $request):array;
    public function reviewRequest(array $request):array;
    public function reduceRequest(array $request):array;
    public function buildRequest(array $request):array;


    public function indexName(array $request):?string;
    public function typeName(array $request):?string;
    public function idName(array $request):?string;
    public function contentList(array $request):array;
}
