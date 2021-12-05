<?php
defined('TYPO3') or die('Access denied.');
call_user_func(function()
{

    /**
     * Default TypoScript for Mysearch
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile(
        \Porthd\Mysearchsite\Config\SelfConst::SELF_NAME,
        'Configuration/TypoScript',
        'MySearch'
    );
});
