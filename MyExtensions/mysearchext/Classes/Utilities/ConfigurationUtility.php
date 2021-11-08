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

use Porthd\My\Exception\MysearchextException;
use TYPO3\CMS\Core\Utility\GeneralUtility;

class ConfigurationUtility
{


    /**
     * Add your timer-classes to the list by using the unique index-name of your timer.
     * Your timer-class must implement interface Porthd\Timer\CustomTimer\TimerInterface
     * used in `ext_localconf.php`
     *
     * example for input:
     * $listOfCustomTimerClasses[YearlyTimer::timerIndexValue()] = DailyTimer::class;
     *
     * @param array $listOfTimerClasses
     * @api
     *
     */
    public static function mergeCustomClassesForExtension(
        $listOfTimerClasses,
        $extName,
        $type
    )
    {
        // add hooks for the datadigger to the configuration
        foreach ($listOfTimerClasses as $key => $className) {
            self::expandNestedArray(
                $GLOBALS,
                ['TYPO3_CONF_VARS', 'EXTCONF',$extName, $type, $key],
                $className,
                true
            );
        }
    }
    /**
     * The method use a path to add into a nested array a new leaf or into an empty array, if the path is free.
     * Existing parts won't be overridden. Otherwise it flags a FALSE.
     *
     * similiar solution see the array-fraework (https://github.com/minwork/array)
     * @testing 20191223
     *
     * @param mixed &$check
     * @param array $nestList
     * @param null $leaf
     * @return bool
     */
    protected static function expandNestedArray(&$check, array $nestList, $leaf = null, $flagException = false)
    {
        $helper = &$check;  // the & is needed to get a point on a array getting by reference
        $flag = true;
        foreach ($nestList as $nestStage) {
            if (is_array($helper)) {
                if (!isset($helper[$nestStage])) {
                    $helper[$nestStage] = [];
                }
                $helper = &$helper[$nestStage];
            } else {
                $flag = false;
                break;
            }
        }
        if (($leaf !== null) && ($flag)) {
            if ((is_array($helper)) &&
                (empty($helper))
            ) {
                $helper = $leaf;
            } else if ($helper !== $leaf){
                $flag = false;
            }  // else entry is allready set - a double call happens for example in TYPO3 10.4 by the extensionmanger after activating an extension
        }
        if ((!$flag) && ($flagException)) {
            throw new MysearchextException(
                'The path `' . implode('/', $nestList) . '` will override information the assoziative array. '.
                'The original entry `' .                print_r($helper, true) . '` will be overridden by `'.
                print_r($leaf, true).'`. Perhaps some definitions in `ext_localconf.php`, `ext_tables.php` or in '.
                'an `[extension]/Configuration/Overrides/*.php` are wrong.',
                1601881723
            );
        }
        return $flag;
    }

    /**
     * Add your timer-classes to the list by using the unique index-name of your timer.
     * Your timer-class must implement interface Porthd\Timer\CustomTimer\TimerInterface
     * used in `ext_localconf.php`
     *
     * example for input:
     * $listOfCustomTimerClasses[YearlyTimer::timerIndexValue()] = DailyTimer::class;
     *
     * @api
     *
     * @param $extName
     * @param $type
     * @param $excludeType
     * @param $checkClassName
     * @return array|void
     */
    public static function extractCustomClassesForExtension(
        $extName,
        $type,
        $excludeType,
        $checkClassName
    )
    {
        // Call post-processing function for constructor:
//            $extName, $type
        $list = [];
        if ((is_array($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$extName][$type])) &&
            (count($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$extName][$type]) > 0)
        ) {
            foreach ($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$extName][$type] as $alias => $className) {
                $classInterface = class_implements($className);
                if (in_array($checkClassName, $classInterface)) {
                    $classObject = GeneralUtility::makeInstance($className);
                    if (is_numeric($alias)) {
                        $list[$classObject->selfName()] = $classObject;
                    } else {
                        $list[$alias] = $classObject;
                    }
                }
            }
            if ((is_array($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$extName][$excludeType])) &&
                (count($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$extName][$excludeType]) > 0)
            ) {
                foreach ($GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$extName][$excludeType] as $alias => $className) {
                    $classInterface = class_implements($className);
                    if (in_array($checkClassName, $classInterface)) {
                        $classObject = GeneralUtility::makeInstance($className);
                        if (isset($list[$classObject::selfName()])) {
                            unset($list[$classObject::selfName()]);
                        }
                        if (isset($list[$alias])) {
                            unset($list[$alias]);
                        }
                    }
                }
            }
        }
        return $list;
    }

}

