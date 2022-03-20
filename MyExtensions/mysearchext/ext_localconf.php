<?php
defined('TYPO3_MODE') || die('Access denied.');

use Porthd\Mysearchext\Controller\MyIndexController;
use Porthd\Mysearchext\Controller\FactorizeController;
call_user_func(
    function () {

        $iconRegistry = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Imaging\IconRegistry::class);

        $iconRegistry->registerIcon(
            'mysearchext-plugin-mysearchext',
            \TYPO3\CMS\Core\Imaging\IconProvider\SvgIconProvider::class,
            ['source' => 'EXT:mysearchext/Resources/Public/Icons/Extension.svg']
        );

        \TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
            'Porthd.Mysearchext',
            'Mysearchext',
            [
                MyIndexController::class => 'mysearchext',
            ],
            // non-cacheable actions
            [
                MyIndexController::class => 'mysearchext',
            ]
        );

        // wizards
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
            'mod {
                wizards.newContentElement.wizardItems.plugins {
                    elements {
                        mysearchext {
                            iconIdentifier = mysearchext-plugin-mysearchext
                            title = LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_mysearchext.name
                            description = LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_mysearchext.description
                            tt_content_defValues {
                                CType = list
                                list_type = mysearchext_mysearchext
                            }
                        }
                    }
                    show = *
                }
           }'
        );

        //Define the Indexer and Resulter of this class
        $list = [
            \Porthd\Mysearchext\Config\SelfConst::GLOBALS_SUBKEY_CUSTOMINDEXER => [
                'porthdMysearchextBasic' => \Porthd\Mysearchext\Elasticsearch\Indexer\BasicIndexer::class
            ],
            \Porthd\Mysearchext\Config\SelfConst::GLOBALS_SUBKEY_EXCLUDEINDEXER => [],
            \Porthd\Mysearchext\Config\SelfConst::GLOBALS_SUBKEY_CUSTOMRESULTER => [
                'porthdMysearchextBasic' => \Porthd\Mysearchext\Elasticsearch\Resulter\BasicResulter::class
            ],
            \Porthd\Mysearchext\Config\SelfConst::GLOBALS_SUBKEY_EXCLUDERESULTER => [],
        ];
        foreach ($list as $classTypes => $classList) {

            \Porthd\Mysearchext\Utilities\ConfigurationUtility::mergeCustomClassesForExtension(
                $classList,
                \Porthd\Mysearchext\Config\SelfConst::SELF_NAME,
                $classTypes
            );
        }

        /**
         * Controller Factorize
         */
        \TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
            'Mysearchext',
            'Factorize',
            [
                FactorizeController::class => 'factorize',
            ],
            // non-cacheable actions
            [
                FactorizeController::class => 'factorize',
            ]
        );

        // wizards
        $iconRegistry = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Imaging\IconRegistry::class);

        // Fun-Plugin factorize
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
            'mod {
                wizards.newContentElement.wizardItems.plugins {
                    elements {
                        factorize {
                            iconIdentifier = mysearchext-plugin-factorize
                            description = LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_factorize.description
                            title = LLL:EXT:mysearchext/Resources/Private/Language/locallang_db.xlf:tx_mysearchext_factorize.name
                            tt_content_defValues {
                                CType = list
                                list_type = mysearchext_factorize
                            }
                        }
                    }
                    show = *
                }
           }'
        );
        $iconRegistry->registerIcon(
            'mysearchext-plugin-factorize',
            \TYPO3\CMS\Core\Imaging\IconProvider\SvgIconProvider::class,
            ['source' => 'EXT:mysearchext/Resources/Public/Icons/user_plugin_factorize.svg']
        );

    }
);

