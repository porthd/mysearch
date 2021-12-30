<?php

namespace Porthd\Mysearchext\Elasticsearch\Indexer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Domain\Model\DataDocumentInterface;

interface IndexerInterface
{

    public function selfName():string;

    /**
     * this is the first place, where you can analyse, modify and add additional data for the search-index
     * @param array $data
     */
    public function makeDataModelExtend(array &$data):void;

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
     * @param array $data
     * @return string|null
     *
     */
    public function indexName(array &$data):?string;
    /**
     * return null,if the default should be used
     *
     * @param array $data
     * @return string|null
     *
     */
    public function idName(array &$data):?string;
    /**
     * return null,if the default should be used
     *
     * @param array $data
     * @param array $searchWordList
     * @return array|null
     */
    public function bodyList(array &$data, $searchWordList = []):?array;

    /**
     * @param array $indexParam
     * @return mixed
     */
    public function insert(array $indexParam);
}
