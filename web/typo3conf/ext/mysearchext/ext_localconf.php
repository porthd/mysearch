<?php
defined('TYPO3_MODE') || die('Access denied.');

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
                'MyIndex' => 'mysearchext, error',
            ],
            // non-cacheable actions
            [
                'MyIndex' => 'mysearchext, error',
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
    }
);
