<?php

namespace Porthd\Mysearchext\Elasticsearch\Normalizer;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Elasticsearch\Common\Exceptions\InvalidArgumentException;
use Elasticsearch\Common\Exceptions\Missing404Exception;
use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\SearchFilter;
use Porthd\Mysearchext\Elasticsearch\Resulter\ResulterInterface;
use Porthd\Mysearchext\Utilities\ResulterUtility;
use TYPO3\CMS\Extbase\Utility\LocalizationUtility;


class FallBackNormalizer
{

    protected const SELF_NAME = 'Porthd_Mysearchext_BasicResulter';

    /**
     * @var string
     */
    protected $indexes = '';

    /**
     *
     * @param SearchFilter $searchFilter
     * @param array $param
     * @return string
     */
    public function extractIndex(SearchFilter $searchFilter,array $param = []): string
    {
        return '';
    }

    /**
     *
     * @return array
     */
    public function getIndexes(): array
    {
        return [];
    }

    /**
     *
     * @return string
     */
    public function selfName(): string
    {
        return SelfConst::INDEX_NAME_BASIC_RESULTER;
    }

    /**
     *
     * @param string $index
     * @param SearchFilter $searchFilter
     * @param int $max
     * @return array|false
     */
    public function search(string $index,  SearchFilter $searchFilter, int $max)
    {
        return false;
    }


    public function getScore($hit):bool
    {
        return false;
    }

    public function getData($item):bool
    {
        return $item;
    }
    /**
     * fallback for general Use
     *
     * @param array $rawHits
     * @param array $myBlocks
     * @param ResulterInterface $currentResulter
     * @return bool
     */
    public function extractHits(array &$rawHits, array $myBlocks, ResulterInterface $currentResulter):bool
    {
        if ((empty($myBlocks)) ||
            (empty($myBlocks['hits']))||
            (empty($myBlocks['hits']['hits']))
        ) {
            return false;
        }
        foreach($myBlocks['hits']['hits'] as $item) {
            $myScore = ($currentResulter->getScore($item))?:$item['_score'];
            $myId = $item['_id'];
            $rawHits[$myId] = [
                'score' => $myScore,
                'resulter' => $currentResulter->selfName(),
                'id' => $item['_id'],
                'data' => $currentResulter->getData($item)?:$item['_source'],
            ];
        }
        return true;
    }

    /**
     * @param array $resultBlocks allow change on the array
     * @param array $settings
     * @param array $searchWordList
     */
    public function mapForOutput(array &$results, array &$searchWordList, array &$settings): void
    {
        foreach ($results as $key => $item) {
            // Quotes
            $pufferLength = $settings['teaser']['nearLength'];
            $ellipse = $settings['teaser']['ellipse'];
            $searchQuotes = [];
            foreach ($searchWordList as $searchWord) {
                $searchQuotes[$searchWord] = ResulterUtility::findTextNear(
                    $searchWord,
                    $item['fullrawtext'],
                    $pufferLength,
                    $ellipse
                );
            }
            $results[$key][SelfConst::OUTPUTNAME_BASIC_QUOTES] = array_filter($searchQuotes);
            // Title
            if (empty($item[SelfConst::OUTPUTNAME_BASIC_TITLE])) {
                if (is_string($item['headlines'])) {
                    $results[$key][SelfConst::OUTPUTNAME_BASIC_TITLE] = $item['headlines'];
                } elseif (is_array($item['headlines'])) {
                    $firstKey = array_key_first($item['headlines']);
                    $results[$key][SelfConst::OUTPUTNAME_BASIC_TITLE] = $item['headlines'][$firstKey];
                } else {
                    $results[$key][SelfConst::OUTPUTNAME_BASIC_TITLE] = LocalizationUtility::translate(
                        'plugin.myIndex.resulter.searchWithoutHeadliune.outputTitle',
                        SelfConst::SELF_NAME
                    );
                }
            }

            // Starttext as a teaser-text
            if (empty($item[SelfConst::OUTPUTNAME_BASIC_SELF])) {
                $results[$key][SelfConst::OUTPUTNAME_BASIC_SELF] = '#';
            }
            // Starttext as a teaser-text
            if (empty($item[SelfConst::OUTPUTNAME_BASIC_TEXT])) {
                $results[$key][SelfConst::OUTPUTNAME_BASIC_TEXT] = ResulterUtility::findTextAroundFirstFound(
                    $item['bodyText'],
                    $searchWordList
                );
            }
            // links as a teaser-text
            if (empty($item[SelfConst::OUTPUTNAME_BASIC_LINKS])) {

            }
        }
    }


}
