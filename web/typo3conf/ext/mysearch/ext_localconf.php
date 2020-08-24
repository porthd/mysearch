<?php
defined('TYPO3_MODE') || die('Access denied.');

call_user_func(
    function()
    {

        \TYPO3\CMS\Extbase\Utility\ExtensionUtility::configurePlugin(
            'Porthd.Mysearch',
            'Mysearch',
            [
                'MyIndex' => 'dashBoard, show, list, simpleSearch, multiSearch, customSearch, deleteIndex, writeInIndex, deleteFromIndex, errorPage',
                'LinkBase' => 'list, show',
            ],
            // non-cacheable actions
            [
                'MyIndex' => 'dashBoard, simpleSearch, multiSearch, customSearch, deleteIndex, writeInIndex, deleteFromIndex, errorPage'
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
		$iconRegistry = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Imaging\IconRegistry::class);

			$iconRegistry->registerIcon(
				'mysearch-plugin-mysearch',
				\TYPO3\CMS\Core\Imaging\IconProvider\SvgIconProvider::class,
				['source' => 'EXT:mysearch/Resources/Public/Icons/user_plugin_mysearch.svg']
			);

    }
);
