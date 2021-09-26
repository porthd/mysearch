<?php
defined('TYPO3_MODE') || die('Access denied.');

call_user_func(
    function () {

        $iconRegistry = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Imaging\IconRegistry::class);

        $iconRegistry->registerIcon(
            'mysearch-plugin-mysearch',
            \TYPO3\CMS\Core\Imaging\IconProvider\SvgIconProvider::class,
            ['source' => 'EXT:mysearch/Resources/Public/Icons/Extension.svg']
        );

        \TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
            'Porthd.Mysearch',
            'Mysearch',
            [
                'MyIndex' => 'mysearch, error',
            ],
            // non-cacheable actions
            [
                'MyIndex' => 'mysearch, error',
            ]
        );

        // wizards
        \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
            'mod {
                wizards.newContentElement.wizardItems.plugins {
                    elements {
                        mysearch {
                            iconIdentifier = mysearch-plugin-mysearch
                            title = LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_mysearch.name
                            description = LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_mysearch.description
                            tt_content_defValues {
                                CType = list
                                list_type = mysearch_mysearch
                            }
                        }
                    }
                    show = *
                }
           }'
        );

        //Define the Indexer and Resulter of this class
        $list = [
            \Porthd\Mysearch\Config\SelfConst::GLOBALS_SUBKEY_CUSTOMINDEXER => [
                'porthdMysearchBasic' => \Porthd\Mysearch\Elasticsearch\Indexer\BasicIndexer::class
            ],
            \Porthd\Mysearch\Config\SelfConst::GLOBALS_SUBKEY_EXCLUDEINDEXER => [],
            \Porthd\Mysearch\Config\SelfConst::GLOBALS_SUBKEY_CUSTOMRESULTER => [
                'porthdMysearchBasic' => \Porthd\Mysearch\Elasticsearch\Resulter\BasicResulter::class
            ],
            \Porthd\Mysearch\Config\SelfConst::GLOBALS_SUBKEY_EXCLUDERESULTER => [],
        ];
        foreach ($list as $classTypes => $classList) {

            \Porthd\Mysearch\Utilities\ConfigurationUtility::mergeCustomClassesForExtension(
                $classList,
                \Porthd\Mysearch\Config\SelfConst::SELF_NAME,
                $classTypes
            );
        }
    }
);
