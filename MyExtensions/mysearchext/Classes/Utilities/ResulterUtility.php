<?php

namespace Porthd\Mysearchext\Utilities;

/***************************************************************
 *
 *  Copyright notice
 *
 *  (c) 2020 Dr. Dieter Porthd <info@mobger.de>
 *
 *  All rights reserved
 *
 *  This script is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/
class ResulterUtility
{

    public const TEXT_DEFAULT_SEARCHWORD = 60;
    public const TEXT_DEFAULT_SHOW = 271; // = 350-80+1
    public const TEXT_BEFORE_MAX = 80;
    public const TEXT_AFTER_MAX = 350;
    public const TEXT_SPACED_ELLIPSE = ' &hellip; ';
    public const LINKS_MAX_SHOW_COUNT = 5;


    /**
     * @param string $searchWord
     * @param string $fullrawtext
     * @param int $pufferLength
     * @param string $ellipse
     * @return string
     */
    public static function findTextNear($searchWord = '', $fullrawtext = '', $pufferLength = 40, $ellipse = '&hellip;')
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

            $result = mb_strcut($fullrawtext, $start, ($end - $start));
        }
        return $result;
    }

    public static function findTextAroundFirstFound(
        string $rawText,
        array &$searchWordList,
        $ellipse = self::TEXT_SPACED_ELLIPSE,
        $before = self::TEXT_BEFORE_MAX,
        $after = self::TEXT_AFTER_MAX

    ) {

        $start = mb_strlen($rawText);
        $textLen = $start;
        $maxLen = 0;
        foreach ($searchWordList as $search) {
            $pos = mb_strpos($rawText, $search);
            $start = min($start, $pos);
            $maxLen = max($maxLen, mb_strlen($search));
        }
        $begin = 0;
        $prefix = '';
        if ($start > $before) {
            $begin = $start - $before;
            $prefix = $ellipse;
        }
        $end = $start + $maxLen + $after;
        $postfix = $ellipse;
        if ($textLen < $end) {
            $end = $textLen;
            $postfix = '';
        }
        return trim($prefix . mb_substr($rawText, $begin, ($end - $begin)) . $postfix);

    }

    public static function findTextFromStart(
        string $rawText,
        $length = self::TEXT_DEFAULT_SHOW,
        $ellipse = self::TEXT_SPACED_ELLIPSE
    ) {

        $rawLength = mb_strlen($rawText);
        if ($length <= $rawLength) {
            return trim($rawText);
        }
        return trim(mb_substr($rawText, 0, $length).$ellipse);


    }
}

