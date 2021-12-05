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

