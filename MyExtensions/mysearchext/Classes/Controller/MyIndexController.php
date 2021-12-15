<?php

namespace Porthd\Mysearchext\Controller;


use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\SearchFilter;
use Porthd\Mysearchext\Elasticsearch\Normalizer\FallBackNormalizer;
use Porthd\Mysearchext\Elasticsearch\Resulter\ResulterInterface;
use Porthd\Mysearchext\Utilities\ConfigurationUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;

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
class MyIndexController extends ActionController
{
    // https://www.glohbe.de/de/elasticsearch-mit-php/

    /**
     * @var FallBackNormalizer
     */
    protected $fallBackNormalizer;

    /**
     * @var SearchFilter
     */
    protected $searchFilter;

    public function __construct(?FallBackNormalizer $fallBackNormalizer = null, ?SearchFilter $searchFilter = null)
    {
        $this->fallBackNormalizer = $fallBackNormalizer ?? new FallBackNormalizer();
        $this->searchFilter = $searchFilter ?? new SearchFilter();
    }


    /**
     * vier felder:  A-,B-,C-Worte, Buh-Worte, Indexliste und Parameter (Als Objekt)
     *  Ablauf
     * Erstelle Rohabfrage (Resulter)
     * Mappe Daten für Output (Resulter)
     * Normalisiere und füge Daten in SPL-Liste ein
     * mache Output
     *
     * @param SearchFilter|null $searchFilter
     */
    public function mysearchextAction(?SearchFilter $searchFilter = null)
    {
        if ($searchFilter !== null) {
            $this->searchFilter = $searchFilter;
        }
        $max = getenv('INDEX_MAX_RESULT') ?? SelfConst::SELF_MAX_RESULT;
        $resulterList = ConfigurationUtility::extractCustomClassesForExtension(
            SelfConst::SELF_NAME,
            SelfConst::GLOBALS_SUBKEY_CUSTOMRESULTER,
            SelfConst::GLOBALS_SUBKEY_EXCLUDERESULTER,
            ResulterInterface::class
        );
        $allBlocks = [];

        /** @var ResulterInterface $resulter */
        foreach ($resulterList as $resulter) {
            $rawHits = [];
            $index = $resulter->extractIndex($this->searchFilter,
                $this->searchFilter->getIndexList()
            );
            $type = $resulter->extractType(
                $this->searchFilter,
                $this->searchFilter->getTypeList()
            );
            if (($myBlocks = $resulter->search($index, $type, $this->searchFilter, $max)) !== false) {
                // each resulter rebuild its own hits in the rwa resultlist
                if ($this->fallBackNormalizer->extractHits($rawHits, $myBlocks, $resulter)) {
                    $allBlocks[] = $rawHits;
                }
            }
        }
        $allResults = array_filter(
            array_merge([], ...$allBlocks)
        );

        $settings = $this->settings;
        foreach ($resulterList as $resulter) {
            $resulter->mapForOutput($allResults, $searchFilter, $settings);
        }

        $this->view->assignMultiple([
            'results' => $allResults,
            'searchFilter' => $searchFilter,
        ]);
    }

    protected function mockAllSearchWords()
    {
        return 'wald, wiesen trolle';
    }

    protected function mockAllResults()
    {
        $results = [];
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
                'Wald' => 'Maecenas nec odio et ante tincidunt tempus. Wald vitae sapien ut libero venenatis faucibus. Nullam ',
                'Trolle' => 'quis, feugiat a, tellus. Phasellus viverra nulla trolle ut metus varius laoreet. Quisque rutrum. Aenean ',
                'Wiesen' => 'ridiculus mus. Donec quam felis, ultricies nec, Wiesen pellentesque eu, pretium quis, sem. Nulla consequat',
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
            'flagShow' => 1,
        ];
        $results[] = $itemOne;
        $itemOne = array_merge($itemOne, [
            'url' => 'https://example.de/test',
            'domain' => 'example.de',
            'domainPlus' => 'example.de/schulze/',
            'header' => 'Lilith ist ungnädig',
            'links' => [
                'exampletest.de/walgter/KlausiMausi?#doof',
                'wulle.de/Klaustro/Heater?#doof',
                'www.harry.com/Klaustro/Klmpner?#doof',

            ],
        ]);
        $results[] = $itemOne;
        return $results;
    }

    protected function findTextNear($searchWord = '', $fullrawtext = '', $pufferLength = 40, $ellipse = '&hellip;')
    {
        $result = '';
        $searchLen = mb_strlen($searchWord);
        $fullLen = mb_strlen($fullrawtext);
        $find = mb_strpos($fullrawtext, $searchWord);
        if ($find !== false) {
            if ($find < $pufferLength) {
                $start = 0;
            } else {
                $start = $find - $pufferLength;
            }
            $end = $find + $pufferLength + $searchLen;
            if ($end >= $fullLen) {
                $end = $fullLen;
            }

            $result = mb_strcut($fullrawtext, $start, $end - $start);
        }
        return $result;
    }
}
