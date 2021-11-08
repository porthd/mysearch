<?php

namespace Porthd\Mysearchext\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Porthd\Mysearchext\Domain\Model\DataDocumentInterface;

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
     * @param array $param
     * @return string
     */
    public function extractIndex(array $param = []): string;

    /**
     * return the list of allowed names for types
     * @return array
     */
    public function getTypes(): array;
    /**
     * if the definition is empty, the default-type will be used
     * extract the index from the parameter
     * @param array $param
     * @return string
     */
    public function extractType(array $param = []): string;

    /**
     * @param string $index
     * @param string $type
     * @param string $searchwords
     * @param int $max
     * @return array|false
     */
    public function search(string $index, string $type, string $searchwords, int $max);

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
    public function getData($item):bool;

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
     * @param array $modifyableResultBlocks allow change on the array
     * @param array $searchWordList
     * @param array $settings
     */
    public function mapForOutput(array &$modifyableResultBlocks, array &$searchWordList, array &$settings):void;

}
