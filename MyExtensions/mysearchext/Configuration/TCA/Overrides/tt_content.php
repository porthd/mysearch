<?php

use TYPO3\CMS\Extbase\Utility\ExtensionUtility;

// Prevent script from being called directly
defined('TYPO3') or die();


(static function() {
        ExtensionUtility::registerPlugin(
            'Porthd.Mysearchext',
            'Mysearchext',
            'my search lister',
            'EXT:mysearchext/Resources/Public/Icons/mysearchext.svg'
        );

})();

(static function() {
        ExtensionUtility::registerPlugin(
            'Porthd.Mysearchext',
            'Factorize',
            'Factorize an integer bitwise',
            'EXT:mysearchext/Resources/Public/Icons/user_plugin_factorize.svg'
        );

})();

