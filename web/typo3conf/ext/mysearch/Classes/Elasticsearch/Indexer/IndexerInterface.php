<?php

namespace Porthd\Mysearch\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearch\Domain\Model\DataDocumentInterface;

interface IndexerInterface
{

    public function selfName():string;

    public function makeDataModelExtend():?DataDocumentInterface;

    public function getNeededRawData():array;

    public function getUrls(array &$requestData):array;

    /**
     * return false,if the data contains som mistake. this would cause an error
     *
     * @param array $request
     * @return bool
     */
    public function normalizeRequest(array &$request):bool;
    public function rebuildRequest(array &$request):bool;

    public function getErrorMessages():array;
    public function addErrorMessage(string $message):void;

    /**
     * return null,if the default should be used
     *
     * @param array $dataForIndex
     * @return string|null
     *
     */
    public function indexName(array &$dataForIndex):?string;
    /**
     * return null,if the default should be used
     *
     * @param array $dataForIndex
     * @return string|null
     *
     */
    public function typeName(array &$dataForIndex):?string;
    /**
     * return null,if the default should be used
     *
     * @param array $dataForIndex
     * @return string|null
     *
     */
    public function idName(array &$dataForIndex):?string;
    /**
     * return null,if the default should be used
     *
     * @param array $dataForIndex
     * @return string|null
     *
     */
    public function bodyList(array &$dataForIndex):array;

    public function insert(array $indexParam);
}
