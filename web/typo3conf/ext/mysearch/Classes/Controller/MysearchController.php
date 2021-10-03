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
     * @param array $currentFilter
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
        $allResults =[];
        $allBlocks = [];
        foreach ($resulterList as $resulter) {
            if (method_exists($resulter,'search')){
                $allBlocks[] = $resulter->search($currentFilter, $max);
            }
        }
        $allResults = array_merge([], ...$allBlocks);
        foreach ($allResults as $item) {
                $item['weight'] = 1;
                $item['url'] = $item['url']??'http://localhost:80';
                $item['domain'] = $item['domain']??'localhost';
                $item['domainPlus'] = $item['domainPlus']??'';
                $item['header'] = $item['header']??'XXX';
                $item['quote'] = $item['quote']??'no quote avaiable';
                $item['links'] = $item['links']??[];
                $item['fullrawtext'] = $item['fullrawtext']??'';
                $item['flagShow'] = 1;

        }
        foreach ($resulterList as $resulter) {
            if (method_exists($resulter,'blackList')){
                $resulter->blackList($allResults);
            }
            if (method_exists($resulter,'weightChange')){
                $resulter->weightChange($allResults);
            }
        }
        $this->view->assignMultiple([
            'result' => $allResults,
            'filter' => $currentFilter,
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
