<?php
declare(strict_types=1);

namespace Porthd\Mysearchext\Controller;



use Porthd\Mysearchext\Services\FactorizeService;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Mvc\Controller\ActionController;
use TYPO3\CMS\Extbase\Utility\LocalizationUtility;

/***************************************************************
 *
 *  Copyright notice
 *
 *  (c) 2021 Dr. Dieter Porthd <info@mobger.de>
 *
 *  All rights reserved
 *
 *  This script is part of the TYPO3-Extension `mysearchext`. It is a free software;
 *  you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/

/**
 * FactorizeController
 */
class FactorizeController extends ActionController
{


    /**
     * action factorize the correct result beginning at the end of the number
     *
     * @param string $testvalue
     * @param string $testleft
     * @param string $testright
     */
    public function factorizeAction($testvalue = '42', $testleft='', $testright='')
    {
        $start = round(microtime(true) * 1000);
        /** @var FactorizeService $factorizeService */
        $factorizeService = GeneralUtility::makeInstance(FactorizeService::class);
        $rawProduct = $testvalue;
        $factorizedBits = $factorizeService->numberStringToNumberArray($rawProduct);
        $bitProduct = $factorizeService->normalizeBitMapToOddNumber($factorizedBits);
        $outBitproduct = array_reverse($bitProduct);
        $productNumber = $factorizeService->bitMaskToNUmberString($bitProduct);
        $flagWarning = (($productNumber !== $rawProduct )?
            LocalizationUtility::translate(
                'factorize.template.factorize.warning.recalulated.number.title.fixed',
                'mysearchext',
                ['raw '=> $rawProduct, 'refactord'=> $productNumber, ]
            ) :
            ''
        );
        if (trim($testleft)!=='') {
            $testleftRaw = $factorizeService->numberStringToNumberArray($testleft);
            $bitleft = $factorizeService->normalizeBitMapToOddNumber($testleftRaw);
            $testleftClean= $factorizeService->bitMaskToNUmberString($bitleft);
            $outBitleft = array_reverse($bitleft);
        }
        if (trim($testright)!=='') {
            $testrightRaw = $factorizeService->numberStringToNumberArray($testright);
            $bitright = $factorizeService->normalizeBitMapToOddNumber($testrightRaw);
            $testrightClean = $factorizeService->bitMaskToNUmberString($bitright);
            $outBitright = array_reverse($bitright);
        }
        $info = [
            'left' => [
                'number' => $testleftClean,
                'bits' => $bitleft,
            ],
            'right' => [
                'number' => $testrightClean,
                'bits' => $bitright,
            ],
        ];

        [$leftBits, $rightBits, $okay] = $factorizeService->factorize($bitProduct);
        $leftNumber = $factorizeService->bitMaskToNUmberString($leftBits);
        $rightNumber = $factorizeService->bitMaskToNUmberString($rightBits);
        $logStatistics= $factorizeService->getLogStatistics();
        $stop = round(microtime(true) * 1000);

        $this->view->assignMultiple([
            'okayElsePrim' => $okay,
            'info' => $info,
            'productNumber' => $productNumber,
            'rawProduct' => $rawProduct,
            'bitProduct' => $bitProduct,
            'rightNumber' => $rightNumber,
            'rightBits' => $rightBits,
            'leftNumber' => $leftNumber,
            'leftBits' => $leftBits,
            'testvalue' => $testvalue,
            'logStatistics' => $logStatistics,
            'gap' => round((($stop - $start)/1000),3),
            'flagWarning' => $flagWarning,
            ]);
    }
}
