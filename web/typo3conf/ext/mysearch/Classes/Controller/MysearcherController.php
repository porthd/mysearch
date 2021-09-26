<?php
namespace Porthd\Mysearch\Controller;


use Porthd\Mysearch\Config\SelfConst;
use Porthd\Mysearch\Elasticsearch\Resulter\ResulterInterface;
use Porthd\Mysearch\Elasticsearch\Merger\MergerInterface;
use Porthd\Mysearch\Utilities\ConfigurationUtility;

/***
 *
 * This file is part of the "Mysearch" Extension for TYPO3 CMS.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 *  (c) 2020 Dr. Dieter Porth <info@mobger.de>, -- privat --
 *
 ***/
/**
 * MyIndexController
 */
class MysearchController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{
    // https://www.glohbe.de/de/elasticsearch-mit-php/
    /**
     * action searchPage
     *
     * @param array $filterMysearch
     */
    public function mysearchPageAction($filterMysearch=[])
    {
        $max = getenv('INDEX_MAX_RESULT')??SelfConst::SELF_MAX_RESULT;
        $resulterList = ConfigurationUtility::extractCustomClassesForExtension(
            SelfConst::SELF_NAME,
            SelfConst::GLOBALS_SUBKEY_CUSTOMRESULTER,
            SelfConst::GLOBALS_SUBKEY_EXCLUDERESULTER,
            ResulterInterface::class
        );
        $mergerList = ConfigurationUtility::extractCustomClassesForExtension(
            SelfConst::SELF_NAME,
            SelfConst::GLOBALS_SUBKEY_CUSTOMMERGER,
            SelfConst::GLOBALS_SUBKEY_EXCLUDEMERGER,
            MergerInterface::class
        );
        $normResult = [];
        foreach($resulterList as $resulter) {
            $indexerResult = $resulter->search($filterMysearch, $max);

            if (!empty($indexerResult)) {
                // Query
                foreach($indexerResult as $item) {
                    $normWeigth = $resulter->extraxctWeight($item);
                    $normItem = [
                        'weight' => $normWeigth,
                        'url' => $resulter->extractLink($item),
                        'header' => $resulter->extractHeader($item),
                        'quote' => $resulter->extractQuotes($item, $filterMysearch),
                        'links' => $resulter->extractLinks($item),
                        'fullrawtext' => $resulter->extractRawText($item),
                    ];
                    $normResult
                }
            }
        }

//        Parameter indexName, typeName,
        $paramList = $filterMysearch->toArray();
        $customParam = $this->addCustomParams();
        $paramList = array_merge($paramList,$customParam);
        $rawList = $this->findQuery($filterMysearch);
        $uniqueList = $this->uniqueById($rawList);
        $resultList = $this->reduceToResult($rawList);
        $indexTypes = $this->getAllowedIndexesTypes();
        $this->view->assignMultiple([
            'flag' => empty($indexerList),
            'resultList' => $resultList,
            'indexTypes' => $indexTypes,

        ]);
    }

    /**
     * action error
     *
     * @return void
     */
    public function errorAction()
    {
    }
}
