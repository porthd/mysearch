<?php

namespace Porthd\Mysearchext\Elasticsearch\Resulter;

// https://dev.to/dendihandian/elasticsearch-in-laradock-nm4 URI for elastic depends to the port 9200 (default)
use Elasticsearch\Common\Exceptions\BadRequest400Exception;
use Elasticsearch\Common\Exceptions\InvalidArgumentException;
use Elasticsearch\Common\Exceptions\Missing404Exception;
use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\SearchFilter;
use Porthd\Mysearchext\Utilities\ResulterUtility;
use TYPO3\CMS\Extbase\Utility\LocalizationUtility;


class BasicResulter implements ResulterInterface
{

    protected const SELF_NAME = 'Porthd_Mysearchext_BasicResulter';

    /**
     * @var string
     */
    protected $indexes = SelfConst::ADDON_BASIC_INDEXNAME;
    /**
     * @var string
     */
    protected $type = SelfConst::ADDON_BASIC_TYPE_NAME;

    /**
     * There is only one index defined for this resulter.
     *
     * @param SearchFilter $searchFilter
     * @param array $param
     * @return string
     */
    public function extractIndex(SearchFilter $searchFilter, array $param = []): string
    {
        return SelfConst::ADDON_BASIC_INDEXNAME;
    }

    /**
     *
     * @return array
     */
    public function getIndexes(): array
    {
        return [SelfConst::ADDON_BASIC_INDEXNAME];
    }

    /**
     * There is only one type defined for this resulter.
     *
     * @param SearchFilter $searchFilter
     * @param array $param
     * @return string
     */
    public function extractType(SearchFilter $searchFilter, array $param = []): string
    {
        return SelfConst::ADDON_BASIC_TYPE_NAME;
    }

    /**
     * @return array
     */
    public function getTypes(): array
    {
        return [SelfConst::ADDON_BASIC_TYPE_NAME];
    }

    function __construct()
    {
        $domain = getenv('DOMAIN_NAME') ?? SelfConst::SELF_DOMAIN_NAME;
        $addPort = getenv('DOMAIN_ELASTIC_ADDPORT') ?? SelfConst::SELF_DOMAIN_ELASTIC_ADDPORT;
        $this->elasticSearch = \Elasticsearch\ClientBuilder::create()
            ->setHosts([$domain . $addPort])
            ->build();
    }

    public function selfName(): string
    {
        return SelfConst::INDEX_NAME_BASIC_RESULTER;
    }

    /**
     * @param string $index
     * @param string $type
     * @param SearchFilter $searchFilter
     * @param int $max
     * @return array|false
     */
    public function search(string $index, string $type, SearchFilter $searchFilter, int $max)
    {
        $searchWords = $searchFilter->getWordsMain() . ',' .
            $searchFilter->getWordsSecond() . ',' .
            $searchFilter->getWordsOptional();
        $searchList = array_unique(
            array_filter(
                preg_split('/[\s,]+/u', $searchWords)
            )
        );
        $removeWords = $searchFilter->getWordsForbidden() . ',' .
            $searchFilter->getWordsStop();
        $removeList = array_unique(
            array_filter(
                preg_split('/[\s,]+/u', $removeWords)
            )
        );
        $resultList = array_filter(array_diff($searchList, $removeList));
        if (!empty($resultList)) {
            $queryString = implode(
                ' OR ',
                $resultList
            );
            $queryString = empty($queryString) ? '*' : $queryString;
            $params = [
                'from' => 0,
                'type' => $type,
                'body' => [
                    'size' => $max,
                    'index' => $index,
                    'query' => [
                        "query_string" => [
                            "query" => $queryString,
                            "fields" => SelfConst::TRANS_INDEXER_LIST_TEXTFIELDS,
                        ],
                    ],
                ],
            ];
        } else {
            $params = [
                'index' => $index,
                'type' => $type,
                // https://stackoverflow.com/questions/67652344/elasticsearch-php-7-return-all-documents-of-a-given-mapping remove Body
//                    https://stackoverflow.com/questions/67652344/elasticsearch-php-7-return-all-documents-of-a-given-mapping

            ];
        }
        try {
            $indexed = $this->elasticSearch->search($params);
            if (is_array($indexed)) {
                return $indexed;
            }
            return false;
        } catch (InvalidArgumentException $e) {
            return false;
        }
    }

    public function getScore($hit): bool
    {
        return false;
    }


    /**
     * the return-value === false mean, the you will use the default-answer
     *
     */
    public function getData($item)
    {
        return false;
    }

    /**
     * fallback for general Use
     *
     * @param array $rawHits
     * @param array $myBlocks
     * @param ResulterInterface $currentResulter
     * @return bool
     */
    public function extractHits(array &$rawHits, array $myBlocks, ResulterInterface $currentResulter): bool
    {
        return false;
    }

    /**
     * @param array $results
     * @param SearchFilter|null $searchfilter
     * @param array $settings
     */
    public function mapForOutput(array &$results, ?SearchFilter $searchfilter, array &$settings): void
    {
        $searchWordList = [];
        if ($searchfilter !== null) {
            $searchWordList = array_unique(array_filter(
                    array_map('trim',
                        explode(
                            ',',
                            $searchfilter->getWordsMain() . ',' . $searchfilter->getWordsSecond() . ',' . $searchfilter->getWordsOptional()
                        )
                    )
                )
            );
        }
        foreach ($results as $key => $item) {
            if (!empty($item['data'])) {
                $itemData = $item['data'];
                // Quotes
                $pufferLength = $settings['teaser']['nearLength'] ?? ResulterUtility::TEXT_DEFAULT_SEARCHWORD;
                $ellipse = $settings['teaser']['ellipse'] ?? ResulterUtility::TEXT_SPACED_ELLIPSE;
                $searchQuotes = [];
                if (empty($searchWordList)) {
                } else {
                    foreach ($searchWordList as $searchWord) {
                        $searchQuotes[$searchWord] = ResulterUtility::findTextNear(
                            $searchWord,
                            $itemData['text'],
                            $pufferLength,
                            $ellipse
                        );
                    }
                }
                $results[$key][SelfConst::OUTPUTNAME_BASIC_QUOTES] = array_filter($searchQuotes);
                // Title
                if (!empty($itemData[SelfConst::INCOME_NAME_BASIC_HEADER])) {
                    if (is_string($itemData[SelfConst::INCOME_NAME_BASIC_HEADER])) {
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_TITLE] = $itemData[SelfConst::INCOME_NAME_BASIC_HEADER];
                    } elseif (is_array($itemData[SelfConst::INCOME_NAME_BASIC_HEADER])) {
                        $firstKey = array_key_first($itemData[SelfConst::INCOME_NAME_BASIC_HEADER]);
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_TITLE] = $itemData[SelfConst::INCOME_NAME_BASIC_HEADER][$firstKey];
                    } else {
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_TITLE] = LocalizationUtility::translate(
                            'plugin.myIndex.resulter.searchWithoutHeadliune.outputTitle',
                            SelfConst::SELF_NAME
                        );
                    }
                }
                // Starttext as a teaser-text
                if (empty($itemData[SelfConst::INCOME_NAME_BASIC_TEXT])) {
                    if (!empty($searchWordList)) {
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_TEXT] = ResulterUtility::findTextAroundFirstFound(
                            $itemData[SelfConst::INCOME_NAME_BASIC_TEXT],
                            $searchWordList
                        );
                    } else {
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_TEXT] = ResulterUtility::findTextFromStart(
                            $itemData[SelfConst::INCOME_NAME_BASIC_TEXT]
                        );
                    }
                }
                // links as a teaser-text
                if (empty($itemData[SelfConst::OUTPUTNAME_BASIC_LINKS])) {
                    if (is_string($itemData[SelfConst::INCOME_NAME_BASIC_LINKS])) {
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_LINKS] = [$itemData[SelfConst::INCOME_NAME_BASIC_LINKS]];
                    } elseif (is_array($itemData[SelfConst::INCOME_NAME_BASIC_LINKS])) {
                        if (count($itemData[SelfConst::INCOME_NAME_BASIC_LINKS]) > ResulterUtility::LINKS_MAX_SHOW_COUNT) {

                            $results[$key][SelfConst::OUTPUTNAME_BASIC_LINKS] = array_slice(
                                $itemData[SelfConst::INCOME_NAME_BASIC_LINKS],
                                0,
                                ResulterUtility::LINKS_MAX_SHOW_COUNT
                            );
                        } else {

                            $results[$key][SelfConst::OUTPUTNAME_BASIC_LINKS] = $itemData[SelfConst::INCOME_NAME_BASIC_LINKS];
                        }
                    } else {
                        $results[$key][SelfConst::OUTPUTNAME_BASIC_LINKS] = [];
                    }

                }
            }
        }
    }


}
