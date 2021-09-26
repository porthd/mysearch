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
    public function mysearchPageAction($currentFilter = [])
    {
        $max = getenv('INDEX_MAX_RESULT') ?? SelfConst::SELF_MAX_RESULT;
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
        $domainBasedResult = [];
        $domainPlusBasedResult = [];
        foreach ($resulterList as $resulter) {
            $indexerResult = $resulter->search($filterMysearch, $max);

            foreach ($indexerResult ?? [] as $item) {
                $normWeigth = $resulter->extraxctWeight($item);
                $url = $resulter->extractLink($item);
                [$domain, $domainPlus] = $this->extractDomainPlus($url);
                $normItem = [
                    'weight' => $normWeigth,
                    'url' => $url,
                    'domain' => $domain,
                    'domainPlus' => $domainPlus,
                    'header' => $resulter->extractHeader($item),
                    'quote' => $resulter->extractQuotes($item, $filterMysearch),
                    'links' => $resulter->extractLinks($item),
                    'fullrawtext' => $resulter->extractRawText($item),
                    'flagShow' => 0,
                ];
                foreach ($mergerList ?? [] as $merger) {
                    $normItem['flagShow'] -= $merger->checkForBlacklink($normItem, $filterMysearch) ?? 0;
                    $normItem['flagShow'] += $merger->checkForWhitelink($normItem, $filterMysearch) ?? 0;
                    $normItem['wordCloud'] .= ',' . $merger->findKeyWords($normItem);
                    $calcWeigth = $merger->recalcWeigth($normItem);
                    $normItem['maxWeigth'] = max($normItem['maxWeigth'], $calcWeigth);
                    $normItem['minWeigth'] = min($normItem['maxWeigth'], $calcWeigth);
                    $normItem['domain'] = min($normItem['maxWeigth'], $calcWeigth);
                }
                if ($normItem['flagShow'] >= 0) {
                    $weight = $normItem['weigth'];
                    if (empty($normResult[$weight])) {
                        $normResult[$weight] = [];
                    }
                    if (empty($domainBasedResult[$domain][$weight])) {
                        $domainBasedResult[$domain][$weight] = [];
                    }
                    if (empty($domainPlusBasedResult[$domainPlus][$weight])) {
                        $domainPlusBasedResult[$domainPlus][$weight] = [];
                    }

                    $normResult[$weight][] = $normItem;
                    $domainBasedResult[$domain][$weight][]= $normItem;
                    $domainPlusBasedResult[$domainPlus][$weight][]= $normItem;
                }
            }
        }
        $myFilter = [];
        foreach($resulterList ??[] as $resulter){

        }
        $mySearchResultTabs = [
            'easy' => $normResult,
            'domain' => $domainBasedResult,
            'domainPlus' => $domainPlusBasedResult,
        ];
        $this->view->assignMultiple([
            'flag' => empty($normResult),
            'result' => $mySearchResultTabs,
            'filter' => $myFilter,
            'currentFilter' => $currentFilter,
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
