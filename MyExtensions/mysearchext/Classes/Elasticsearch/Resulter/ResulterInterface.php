<?php

namespace Porthd\Mysearchext\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Domain\Model\SearchFilter;

interface ResulterInterface
{

    public function selfName():string;

    /**
     * return the list of allowed names for indexes
     * @return array
     */
    public function getIndexes(): array;

    /**
     * if the definition is empty, the default-index will be used
     * extract the index from the parameter
     *
     * @param SearchFilter $searchFilter
     * @param array $param
     * @return string
     */
    public function extractIndex(SearchFilter $searchFilter, array $param = []): string;

    /**
     * @param string $index
     * @param SearchFilter $searchwords
     * @param int $max
     * @return array|false
     */
    public function search(string $index, SearchFilter $searchfilter, int $max);

    /**
     * If the method return false, the fallbackfunction will take the falus of elasticsearch.
     * You can define your own method to calculate an individual score
     *
     */
    public function getScore($hit):bool;


    /**
     * If the method return false, the fallbackfunction will take the falus of elasticsearch.
     * You can define your own method to calculate an individual score
     *
     */
    public function getData($item);

    /**
     * It adds to rawHits the json-documents, which is iteralable and contain output-information in the first layer of subarray.
     * if the method returns false, the default-procedure will be used
     *
     * @param array $rawHits
     * @param array $myBlocks
     * @param ResulterInterface $currentResulter
     * @return bool
     */
    public function extractHits(array &$rawHits, array $myBlocks,  ResulterInterface $currentResulter):bool;

    /**
     * @param array $modifyableResultBlocks
     * @param SearchFilter|null $searchfilter
     * @param array $settings
     */
    public function mapForOutput(array &$modifyableResultBlocks, ?SearchFilter $searchfilter, array &$settings):void;

}
