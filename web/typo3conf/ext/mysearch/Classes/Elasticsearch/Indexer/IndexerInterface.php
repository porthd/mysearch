<?php

namespace Porthd\Mysearch\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Domain\Model\DataDocumentInterface;

interface IndexerInterface
{

    public function selfName():string;

    public function makeDataModelExtend():?DataDocumentInterface;

    public function getNeededRawData():array;

    public function normalizeRequest(array &$request):bool;
    public function extendRequest(array &$request):bool;
    public function reviewRequest(array &$request):bool;
    public function reduceRequest(array &$request):bool;

    public function getErrorMessages():array;
    public function addErrorMessage(string $message):void;

    public function indexName(array &$dataForIndex):?string;
    public function typeName(array &$dataForIndex):?string;
    public function idName(array &$dataForIndex):?string;
    public function bodyList(array &$dataForIndex):array;

    public function insert(array $indexParam);
}
