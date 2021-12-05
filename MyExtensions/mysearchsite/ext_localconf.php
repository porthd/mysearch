<?php
defined('TYPO3') or die('Access denied.');
/***************
 * Add default RTE configuration
 */
$GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets'][\Porthd\Mysearchsite\Config\SelfConst::SELF_NAME] = 'EXT:mysearchsite/Configuration/RTE/Default.yaml';

/***************
 * PageTS
 */
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig('@import "EXT:mysearchsite/Configuration/TsConfig/Page/All.tsconfig"');
