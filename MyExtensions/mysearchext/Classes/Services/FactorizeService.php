<?php

namespace Porthd\Mysearchext\Services;

use func;

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
 * Fun-Class FactorizeService
 * Is there a simple way to get the factors of a product in a simple way for numbers greater the the bigint ()
 *
 * The algorithm tried a reverse-multiplication by using the bits of the number
 *
 * Version 20210508 tried the products with big numbers first.
 * => The number of bit of the smallest factor seems to limet the needed number of time/tests. I have not yet understand why. I can't describe the effect with words.
 * The current Version starts with small numbers, because the solving is faster.
 *
 * Fun-Question
 * Are there checks, which can help to reduce the number of tests.
 * Is it possible, to solve analytically the equations for each digit?
 *
 * @package Porthd\mysearchext\FactorizeService
 */
class FactorizeService
{
    protected const MIN_LENGTH = 3;

    /**
     * @var array
     */
    protected $bitMask = [];

    /**
     * @var array
     */
    protected $overflowVector = [];

    /**
     * @var int
     */
    protected $length = 0;

    /**
     * @var int
     */
    protected $left = 0;

    /**
     * @var array
     */
    protected $resultLeft = [];

    /**
     * @var int
     */
    protected $right = 0;

    /**
     * @var array
     */
    protected $resultRight = [];

    /**
     * @var array
     */
    protected $logger = [];

    /**
     * @var array
     */
    protected $never = [];

    /**
     * @var array
     */
    protected $fail = [];

    /**
     * @var array
     */
    protected $okay = [];

    /**
     * @var string
     */
    protected $vary = '';
    /**
     * @var array
     */
    protected $varyList = [];

    /**
     * @var array
     */
    protected $loggerVary = [];

    /**
     * @var array
     */
    protected $neverVary = [];

    /**
     * @var array
     */
    protected $failVary = [];

    /**
     * @var array
     */
    protected $okayVary = [];

    /**
     * find by Variation Left * right = bitMask
     * if okay is false, there was no factor found. The number is a prime.
     *
     * @param array $bitMask
     */
    public function factorize(array $bitMask)
    {
        $this->resetForFactorize($bitMask);
        if ($this->length > self::MIN_LENGTH) {
            // if length of bitmask is odd, the leeading 1 in the bitmask is the result from an overlay
            $left = 2;
            $right = (int)$this->length -$left;
            while ($left <= (int)floor(($this->length) / 2)) {
                foreach ([0,1] as $overlay) {
                    $right = (int)$this->length  -$overlay - $left;
                    [$leftBits, $rightBits] = $this->defineBitMaskForBothFactorsByLength($left, $right);
                    $this->left = $left;
                    $this->right = $right;
                    $this->resultLeft = array_fill(0, $left, 0);
                    $this->resultRight = array_fill(0, $right, 0);
                    $this->resetForVaryFactorize('l-' . $left . ':' . 'r-' . $right . '#o-' . $overlay);
                    // there are only odd-products. in that case the first bit must 1 in both factors.
                    // the algorithmn start with the second bit
                    $digitIndex = 1;
                    $overflow = 0;
                    if ($this->tryFactorizeDigitByDigit($digitIndex, $leftBits, $rightBits, $overflow)) {
                        return [$this->resultLeft, $this->resultRight, true];
                    }
                }
                $left++;
            }
        } // all odd numbers with at least three bits are prime
        return [[1], $this->bitMask, false];

    }

    /**
     * find by Variation Left * right = bitMask
     * if okay is false, there was no factor found. The number is a prime.
     *
     * @param array $bitMask
     */
    public function factorize_first_20210508(
        array $bitMask
    ) {
        $this->resetForFactorize($bitMask);
        // if length of bitmask is odd, the leeading 1 in the bitmask is the result from an overlay
        foreach ([0, 1] as $overlay) {
            $left = (int)floor(($this->length - $overlay) / 2);
            $right = (int)$this->length - $overlay - $left;
            while (($right > 1) && ($left > 1)) {
                [$leftBits, $rightBits] = $this->defineBitMaskForBothFactorsByLength($left, $right);
                $this->left = $left;
                $this->right = $right;
                $this->resultLeft = array_fill(0, $left, 0);
                $this->resultRight = array_fill(0, $right, 0);
                $this->resetForVaryFactorize('l-' . $left . ':' . 'r-' . $right . '#o-' . $overlay);
                // there are only odd-products. in that case the first bit must 1 in both factors.
                // the algorithmn start with the second bit
                $digitIndex = 1;
                $overflow = 0;
                if ($this->tryFactorizeDigitByDigit($digitIndex, $leftBits, $rightBits, $overflow)) {
                    return [$this->resultLeft, $this->resultRight, true];
                }
                $left--;
                $right++;
            }
        }
        return [[1], $this->bitMask, false];
    }

    /**
     * a recursive test for equal check of digits
     * @param $digitIndex
     * @param $leftBits
     * @param $rightBits
     * @param $getFlow
     * @return bool
     */
    public function tryFactorizeDigitByDigit(
        $digitIndex,
        $leftBits,
        $rightBits,
        $getFlow
    ) {
        $flag = false;

        if ($digitIndex < ($this->left -1)) { //the leading-bit must every time 1
            foreach ([0, 1] as $leftVal) {
                $leftBits[$digitIndex] = $leftVal;
                if ($digitIndex < ($this->right)) { //the leading-bit must every time 1
                    foreach ([0, 1] as $rightVal) {
                        $rightBits[$digitIndex] = $rightVal;
                        $flag = $this->checkDigitAtPlace($getFlow, $digitIndex, $leftBits, $rightBits);
                        if ($flag) {
                            break;
                        }
                    }
                } else { // the right is equal or greater than left. The else-case should never happen
                    $this->neverVary[$this->vary][$digitIndex]++;
                    $this->never[$digitIndex]++;
                    $flag = false;
                }
                if ($flag) {
                    break;
                }
            }
        } else {
            if ($digitIndex < ($this->right-1)) { //the leading-bit must every time 1
                foreach ([0, 1] as $rightVal) {
                    $rightBits[$digitIndex] = $rightVal;
                    $flag = $this->checkDigitAtPlace($getFlow, $digitIndex, $leftBits, $rightBits);
                    if ($flag) {
                        break;
                    }
                }
            } else {
                if ($digitIndex < $this->length) {
                    $flag = $this->checkDigitAtPlace($getFlow, $digitIndex, $leftBits, $rightBits);
                } else {
                    // DigitIndex greater than allowed all checks are true

                    $flag = true;
                    // save the result
                    $this->resultLeft = $leftBits;
                    $this->resultRight = $rightBits;
                }
            }
        }

        return $flag;
    }

    public function normalizeBitMapToOddNumber(
        array $bitMask
    ): array {
        while ((!empty($bitMask)) && ($bitMask[0] === 0)) {
            unset($bitMask[0]);
            $bitMask = array_merge($bitMask);
        }
        return $bitMask;
    }

    /**
     * @param string $numberString
     * @return array
     */
    public function numberStringToNumberArray(
        string $numberString = ''
    ): array {
        $rawDigits = preg_replace("/[^0-9]/", "", $numberString);
        $result = [];
        if (strlen($rawDigits) > 0) {
            $onlyDigits = array_reverse(str_split($rawDigits));
            $onlyDigits = $this->removeLeadingZeros($onlyDigits);
            if (!empty($onlyDigits)) {
                while (!empty($onlyDigits)) {
                    $result[] = $this->divideEachDigitInNumberArrayByTwo($onlyDigits);
                    $onlyDigits = $this->removeLeadingZeros($onlyDigits);
                    if (empty($onlyDigits)) {
                        break; // while loop
                    }
                }
            }
        }
        return $result;
    }


    /**
     * @param array $bitMask represents 101010 = 42, inverted because array starts with index 0
     * @return string
     */
    public function bitMaskToNUmberString(
        array $bitMask = [0, 1, 0, 1, 0, 1]
    ): string {
        $help = [1]; //Result for the first loop of Help. This trick make the term easier
        $result = array_fill(0, count($bitMask), 0);
        $count = 0;
        while (!empty($bitMask)) {
            if ($count > 0) {
                $len = count($help);
                $overflow = 0;
                for ($i = 0; $i < $len; $i++) {
                    $wert = $overflow + $help[$i] * 2;
                    $help[$i] = $wert % 10;
                    $overflow = (int)floor($wert / 10);
                }
                if ($overflow > 0) {
                    $help[$len] = $overflow;
                }
            }
            $bit = array_shift($bitMask);
            if ($bit > 0) {
                $len = count($help);
                $overflow = 0;
                for ($i = 0; $i < $len; $i++) {
                    $wert = $result[$i] + $overflow + $help[$i];
                    $result[$i] = $wert % 10;
                    $overflow = (int)floor($wert / 10);
                }
                if ($overflow > 0) {
                    $result[$len] = $overflow;
                }
            }
            $count++;
        }

        return implode(
            '',
            array_reverse(
                $this->removeLeadingZeros($result)
            )
        );
    }

    /**
     * remove leading zero digits in the number (write from left to right => Start with index 0 in StringArray)
     * @param array $onlyDigits
     * @param int $length
     * @return array
     */
    protected function removeLeadingZeros(
        array $onlyDigits
    ): array {
        //Remove leading zeros, if
        $length = count($onlyDigits) - 1;
        while (($length >= 0) &&
            ($onlyDigits[$length] == 0)
        ) {
            array_pop($onlyDigits);
            $length = count($onlyDigits) - 1;
        }
        return $onlyDigits;
    }

    /**
     * /div a array-Number by 2 and return the modulo-rest
     *
     * @param array $onlyDigits
     * @param int $length
     * @return int
     */
    protected function divideEachDigitInNumberArrayByTwo(
        array &$onlyDigits
    ): int {
        $overflow = 0;
        // Divide digits in number by 2
        for ($i = (count($onlyDigits) - 1); $i >= 0; $i--) {
            $digit = $onlyDigits[$i];
            $newOverflow = ((($digit % 2) > 0) ?
                10 :
                0
            );
            $onlyDigits[$i] = (int)floor(($overflow + $onlyDigits[$i]) / 2);
            $overflow = $newOverflow;
        }
        return (($overflow > 0) ? 1 : 0);
    }

    /**
     * define for testing the bitmask for two numbers
     * the structure is i.e. 1, 11, 101, 1001, 10001, ... 1000001, ...
     * @param float $left
     * @param float $right
     * @return array
     */
    protected function defineBitMaskForBothFactorsByLength(
        int $left,
        int $right
    ): array {
        $leftBits = array_fill(0, $left, 0);
        $leftBits[0] = 1;
        $leftBits[($left - 1)] = 1;
        $rightBits = array_fill(0, $right, 0);
        $rightBits[0] = 1;
        $rightBits[($right - 1)] = 1;
        return [$leftBits, $rightBits];
    }

    /**
     * @param array $bitMask
     */
    protected function resetForVaryFactorize(
        $vary
    ): void {
        $this->vary = $vary;
        $this->varyList[$vary] = $vary;
        $this->loggerVary[$vary] = $this->overflowVector;
        $this->okayVary[$vary] = $this->overflowVector;
        $this->neverVary[$vary] = $this->overflowVector;
        $this->failVary[$vary] = $this->overflowVector;
    }

    /**
     * @param array $bitMask
     */
    protected function resetForFactorize(
        array $bitMask
    ): void {
        $this->bitMask = $bitMask;
        $this->length = count($this->bitMask);
        $this->overflowVector = array_fill(0, $this->length, 0);
        $this->logger = $this->overflowVector;
        $this->okay = $this->overflowVector;
        $this->never = $this->overflowVector;
        $this->fail = $this->overflowVector;
        $this->vary = '';
        $this->varyList = [];
        $this->loggerVary = [];
        $this->okayVary = [];
        $this->neverVary = [];
        $this->failVary = [];
    }

    /**
     * @param $getFlow
     * @param $digitIndex
     * @param $leftBits
     * @param $rightBits
     * @return bool
     */
    protected function checkDigitAtPlace(
        $getFlow,
        $digitIndex,
        $leftBits,
        $rightBits
    ): bool {
        $value = (int)$getFlow;
        for ($i = 0; $i <= $digitIndex; $i++) {
            $j = $digitIndex - $i;
            if (($i < $this->left) && ($j < $this->right)) {
                $value += (int)$leftBits[$i] * $rightBits[$j];
            }
        }
        $this->logger[$digitIndex]++;
        $this->loggerVary[$this->vary][$digitIndex]++;
        if (($value % 2) === $this->bitMask[$digitIndex]) {
            $this->okay[$digitIndex]++;
            $this->okayVary[$this->vary][$digitIndex]++;
            $flag = $this->tryFactorizeDigitByDigit(
                $digitIndex + 1,
                $leftBits,
                $rightBits,
                (int)floor($value / 2)
            );
        } else {
            $flag = false;
            $this->failVary[$this->vary][$digitIndex]++;
            $this->fail[$digitIndex]++;
        }
        return $flag;
    }

    public function getLogStatistics()
    {
        $globalByIndex = [];
        $globalByVary = [];
        $length = $this->length;
        for ($i = 0; $i < $length; $i++) {
            $globalByIndex[$i] = [
                'bitindex' => $i,
                'logger' => $this->logger[$i],
                'okay' => $this->okay[$i],
                'never' => $this->never[$i],
                'fail' => $this->fail[$i],
            ];
        }
        foreach ($this->varyList as $vary) {
            $globalByVary[$vary] = [];
            for ($i = 0; $i < $length; $i++) {
                $globalByVary[$vary][$i] = [
                    'vary' => $vary,
                    'bitindex' => $i,
                    'logger' => $this->loggerVary[$vary][$i],
                    'okay' => $this->okayVary[$vary][$i],
                    'never' => $this->neverVary[$vary][$i],
                    'fail' => $this->failVary[$vary][$i],
                ];
            }
        }
        return [
            'globalByIndex' => $globalByIndex,
            'globalByVary' => $globalByVary,
            'global' => [
                'countCheck' => $this->logger,
                'neverInTry' => $this->never,
                'okayInCheck' => $this->okay,
                'failInCheck' => $this->fail,
            ],
            'vary' => [
                'countCheck' => $this->loggerVary,
                'neverInTry' => $this->neverVary,
                'okayInCheck' => $this->okayVary,
                'failInCheck' => $this->failVary,
            ],
        ];
    }
}
