<?php

namespace Porthd\Mysearchext\Controller;


use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\SearchFilter;
use Porthd\Mysearchext\Elasticsearch\Resulter\FallBackResulter;
use Porthd\Mysearchext\Elasticsearch\Resulter\ResulterInterface;

use Porthd\Mysearchext\Utilities\ConfigurationUtility;
use TYPO3\CMS\Core\Utility\GeneralUtility;

/***
 *
 * This file is part of the "Mysearchext" Extension for TYPO3 CMS.
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
class MyIndexController extends \TYPO3\CMS\Extbase\Mvc\Controller\ActionController
{
    // https://www.glohbe.de/de/elasticsearch-mit-php/

    /**
     * @var FallBackResulter
     */
    protected $fallBackResulter;

    /**
     * Inject the offer repository
     *
     * @param FallBackResulter $fallBackResulter
     */
    public function injectFallBackResulter(FallBackResulter $fallBackResulter)
    {
        $this->fallBackResulter = $fallBackResulter;
    }

    /**
     * vier felder:  A-,B-,C-Worte, Buh-Worte, Indexliste und Parameter (Als Objekt)
     *  Ablauf
     * Erstelle Rohabfrage (Resulter)
     * Mappe Daten für Output (Resulter)
     * Normalisiere und füge Daten in SPL-Liste ein
     * mache Output
     */
    /**
     * @param string $searchwords
     * @param array $param
     */
    /**
     * @param null $searchFilter
     */
    public function mysearchextAction ($searchFilter = null)
    {
        if (empty($searchFilter)) {
            $searchFilter = GeneralUtility::makeInstance(SearchFilter::class);
        }
        $max = getenv('INDEX_MAX_RESULT') ?? SelfConst::SELF_MAX_RESULT;

        $resulterList = ConfigurationUtility::extractCustomClassesForExtension(
            SelfConst::SELF_NAME,
            SelfConst::GLOBALS_SUBKEY_CUSTOMRESULTER,
            SelfConst::GLOBALS_SUBKEY_EXCLUDERESULTER,
            ResulterInterface::class
        );
        $allBlocks = [];
        $searchWordList = array_filter(
            array_map('trim',
                (preg_split("/[\s,]+/", $searchwords)?:[]),
                [' \n\r\t\v\0']
            )
        );

        $rawHits=[];
        foreach ($resulterList as $resulter) {
            $index = $resulter->extractIndex($param);
            $type = $resulter->extractType($param);
            if (($myBlocks = $resulter->search($index, $type, $searchwords, $max)) !== false) {
                // each resulter rebuild its own hits in the rwa resultlist
                $this->fallBackResulter->extractHits($rawHits, $myBlocks, $resulter);
            }
        }
        $allResults = array_filter(
            array_merge([], ...$allBlocks)
        );

        $settings = $this->settings;
        foreach ($resulterList as $resulter) {
            $resulter->mapForOutput($allResults, $searchWordList, $settings);
        }

//        $pufferLength = $this->settings['teaser']['nearLength'];
//        $ellipse = $this->settings['teaser']['ellipse'];
//        foreach ($allResults as $item) {
//
//                $item['weight'] = 1;
//                $item['url'] = $item['url']??'http://localhost:80';
//                $item['domain'] = $item['domain']??'localhost';
//                $item['domainPlus'] = $item['domainPlus']??'';
//                $item['header'] = $item['header']??'XXX';
//                $item['text'] = $item['quote']??'no quote avaiable';
//                $item['links'] = $item['links']??[];
//                $item['fullrawtext'] = $item['fullrawtext']??'';
//                $item['flagShow'] = 1;
//                $searchQuotes = [];
//                foreach($searchWordList as $searchWord){
//                    $searchQuotes[$searchWord] = $this->findTextNear($searchWord,  $item['fullrawtext'], $pufferLength,$ellipse);
//                }
//                $item['searchQuotes']= array_filter($searchQuotes);
//        }
//        foreach ($resulterList as $resulter) {
//            if (method_exists($resulter,'blackList')){
//                $resulter->blackList($allResults);
//            }
//            if (method_exists($resulter,'weightChange')){
//                $resulter->weightChange($allResults);
//            }
//        }
//        $searchwords = $this->mockAllSearchWords();
//        $allResults = $this->mockAllResults();
        $this->view->assignMultiple([
            'results' => $allResults,
            'searchFilter' => $searchFilter,
        ]);
    }

    protected function mockAllSearchWords(){
        return 'wald, wiesen trolle';
    }
    protected function mockAllResults(){
        $results=[];
        $itemOne = [
            'weight' => 1,
'url' => 'https://test.de/example',
'domain' => 'test.de',
'domainPlus' => 'test.de/meyer/',
'header' => 'Walter ist willig',
'quote' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                    eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur
                    ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat
                    mascsa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,
                    rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer
                    tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo
                    ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra
                    quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean
                    imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam
                    rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet
                    adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.
                    Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam
                    quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet
                    nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus
                    nunc,',
'links' => [
    'test.de/walgter/klau?#doof',
    'example.de/Klaustro/Bummel?#doof',
    'www.testexample.com/Klaustro/Bummel?#doof',
    ],
            'searchQuotes' => [
               'Wald'=> 'Maecenas nec odio et ante tincidunt tempus. Wald vitae sapien ut libero venenatis faucibus. Nullam ',
                'Trolle'=>'quis, feugiat a, tellus. Phasellus viverra nulla trolle ut metus varius laoreet. Quisque rutrum. Aenean ',
                'Wiesen'=>'ridiculus mus. Donec quam felis, ultricies nec, Wiesen pellentesque eu, pretium quis, sem. Nulla consequat',
            ],

'fullrawtext' => 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula
                    eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur
                    ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat
                    massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo,
                    rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer
                    tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo
                    ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra
                    quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean
                    imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam
                    rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet
                    adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.
                    Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam
                    quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet
                    nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus
                    nunc,',
'flagShow'  => 1,
        ];
        $results[] = $itemOne;
        $itemOne = array_merge($itemOne,[
            'url' => 'https://example.de/test',
            'domain' => 'example.de',
            'domainPlus' => 'example.de/schulze/',
            'header' => 'Lilith ist ungnädig',
            'links' =>[
                'exampletest.de/walgter/KlausiMausi?#doof',
                'wulle.de/Klaustro/Heater?#doof',
                'www.harry.com/Klaustro/Klmpner?#doof',

            ],
        ]);
        $results[] = $itemOne;
        return $results;
    }
    protected function findTextNear($searchWord='',  $fullrawtext='', $pufferLength=40, $ellipse='&hellip;' )

    {
        $result = '';
        $searchLen = mb_strlen($searchWord);
        $fullLen = mb_strlen($fullrawtext);
        $find = mb_strpos($fullrawtext,$searchWord);
        if ($find !== false) {
            if ($find < $pufferLength) {
                $start = 0;
            } else {
                $start = $find - $pufferLength;
            }
            $end = $find + $pufferLength+ $searchLen;
            if ($end>= $fullLen) {
                $end = $fullLen;
            }

            $result=mb_strcut($fullrawtext,$start,$end-$start );
        }
        return $result;
    }
}
