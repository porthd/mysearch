<?php
defined('TYPO3_MODE') || die('Access denied.');

call_user_func(
    function()
    {

        \TYPO3\CMS\Extbase\Utility\ExtensionUtility::registerPlugin(
            'Porthd.Mysearch',
            'Mysearch',
            'mysearch'
        );

        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile('mysearch', 'Configuration/TypoScript', 'MySearch');

        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addLLrefForTCAdescr('tx_mysearch_domain_model_myindex', 'EXT:mysearch/Resources/Private/Language/locallang_csh_tx_mysearch_domain_model_myindex.xlf');
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::allowTableOnStandardPages('tx_mysearch_domain_model_myindex');

        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addLLrefForTCAdescr('tx_mysearch_domain_model_linkbase', 'EXT:mysearch/Resources/Private/Language/locallang_csh_tx_mysearch_domain_model_linkbase.xlf');
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::allowTableOnStandardPages('tx_mysearch_domain_model_linkbase');

        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addLLrefForTCAdescr('tx_mysearch_domain_model_typeoflink', 'EXT:mysearch/Resources/Private/Language/locallang_csh_tx_mysearch_domain_model_typeoflink.xlf');
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::allowTableOnStandardPages('tx_mysearch_domain_model_typeoflink');

        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addLLrefForTCAdescr('tx_mysearch_domain_model_gradeoflink', 'EXT:mysearch/Resources/Private/Language/locallang_csh_tx_mysearch_domain_model_gradeoflink.xlf');
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::allowTableOnStandardPages('tx_mysearch_domain_model_gradeoflink');

    }
);
