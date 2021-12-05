<?php
defined('TYPO3') or die('Access denied.');
call_user_func(function()
{

    /**
     * Default PageTS for Mysearch
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::registerPageTSConfigFile(
        \Porthd\Mysearchsite\Config\SelfConst::SELF_NAME,
        'Configuration/TsConfig/Page/All.tsconfig',
        'MySearch'
    );
});
