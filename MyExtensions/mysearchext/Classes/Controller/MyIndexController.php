<?php

namespace Porthd\Mysearchext\Controller;


use Porthd\Mysearchext\Config\SelfConst;
use Porthd\Mysearchext\Domain\Model\SearchFilter;
use Porthd\Mysearchext\Elasticsearch\Normalizer\FallBackNormalizer;
use Porthd\Mysearchext\Elasticsearch\Resulter\HelperResulterService;
use Porthd\Mysearchext\Elasticsearch\Resulter\ResulterInterface;
use Porthd\Mysearchext\Utilities\ConfigurationUtility;
use TYPO3\CMS\Core\Utility\GeneralUtility;
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

    /**
     * @var HelperResulterService
     */
    protected $helperResulterService;

    public function __construct(
        ?FallBackNormalizer $fallBackNormalizer = null,
        ?SearchFilter $searchFilter = null,
        ?HelperResulterService $helperResulterService = null
    ) {
        $this->fallBackNormalizer = $fallBackNormalizer ?? new FallBackNormalizer();
        $this->searchFilter = $searchFilter ?? new SearchFilter();
        $this->helperResulterService = $helperResulterService ?? new HelperResulterService();
    }


    /**
     * vier felder:  A-,B-,C-Worte, Buh-Worte, Indexliste und Parameter (Als Objekt)
     *  Ablauf
     * Erstelle Rohabfrage (Resulter)
     * Mappe Daten für Output (Resulter)
     * Normalisiere und füge Daten in SPL-Liste ein
     * mache Output
     *
     * @param SearchFilter|null $searchfilter
     */
    public function mysearchextAction(?SearchFilter $searchfilter = null)
    {
        if ($searchfilter !== null) {
            $this->searchFilter = $searchfilter;
        } else {
            $this->searchfilter = GeneralUtility::makeInstance(SearchFilter::class);
        }
        $max = getenv('INDEX_MAX_RESULT') ?? SelfConst::SELF_MAX_RESULT;
        $max = ($max> 0) ? $max: SelfConst::SELF_MAX_RESULT;
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
            if (($myBlocks = $resulter->search($index, $this->searchFilter, $max)) !== false) {
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
            $resulter->mapForOutput($allResults, $this->searchfilter, $settings);
        }

        $listOfIndicesRaw = $this->helperResulterService->getCurrentIndexes();
        $listOfIndices = array_column($listOfIndicesRaw, 'index');
        $this->view->assignMultiple([
            'results' => $allResults,
            'searchfilter' => $this->searchfilter,
            'searchIndices' => $listOfIndices,
        ]);
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
