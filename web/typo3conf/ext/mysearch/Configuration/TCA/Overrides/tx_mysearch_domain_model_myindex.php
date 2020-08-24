<?php
defined('TYPO3_MODE') || die();

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::makeCategorizable(
   'mysearch',
   'tx_mysearch_domain_model_myindex'
);
