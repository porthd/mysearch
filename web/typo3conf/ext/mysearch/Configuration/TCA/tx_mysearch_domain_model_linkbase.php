<?php
return [
    'ctrl' => [
        'title' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase',
        'label' => 'link',
        'tstamp' => 'tstamp',
        'crdate' => 'crdate',
        'cruser_id' => 'cruser_id',
        'sortby' => 'sorting',
        'versioningWS' => true,
        'languageField' => 'sys_language_uid',
        'transOrigPointerField' => 'l10n_parent',
        'transOrigDiffSourceField' => 'l10n_diffsource',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'searchFields' => 'link,link_hash,index_ident,type,grade,title,description,crawl_start_link,login_param,htaccess_param,payment_param',
        'iconfile' => 'EXT:mysearch/Resources/Public/Icons/tx_mysearch_domain_model_linkbase.gif'
    ],
    'interface' => [
        'showRecordFieldList' => 'sys_language_uid, l10n_parent, l10n_diffsource, hidden, link, link_hash, link_score_factor, index_ident, index_score_factor, type, grade, title, description, crawl_deep, crawl_start_link, crawl_connections, login_param, htaccess_param, payment_param',
    ],
    'types' => [
        '1' => ['showitem' => 'sys_language_uid, l10n_parent, l10n_diffsource, hidden, link, link_hash, link_score_factor, index_ident, index_score_factor, type, grade, title, description, crawl_deep, crawl_start_link, crawl_connections, login_param, htaccess_param, payment_param, --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.access, starttime, endtime'],
    ],
    'columns' => [
        'sys_language_uid' => [
            'exclude' => true,
            'label' => 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.language',
            'config' => [
                'type' => 'select',
                'renderType' => 'selectSingle',
                'special' => 'languages',
                'items' => [
                    [
                        'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.allLanguages',
                        -1,
                        'flags-multiple'
                    ]
                ],
                'default' => 0,
            ],
        ],
        'l10n_parent' => [
            'displayCond' => 'FIELD:sys_language_uid:>:0',
            'exclude' => true,
            'label' => 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.l18n_parent',
            'config' => [
                'type' => 'select',
                'renderType' => 'selectSingle',
                'default' => 0,
                'items' => [
                    ['', 0],
                ],
                'foreign_table' => 'tx_mysearch_domain_model_linkbase',
                'foreign_table_where' => 'AND {#tx_mysearch_domain_model_linkbase}.{#pid}=###CURRENT_PID### AND {#tx_mysearch_domain_model_linkbase}.{#sys_language_uid} IN (-1,0)',
            ],
        ],
        'l10n_diffsource' => [
            'config' => [
                'type' => 'passthrough',
            ],
        ],
        't3ver_label' => [
            'label' => 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.versionLabel',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'max' => 255,
            ],
        ],
        'hidden' => [
            'exclude' => true,
            'label' => 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.visible',
            'config' => [
                'type' => 'check',
                'renderType' => 'checkboxToggle',
                'items' => [
                    [
                        0 => '',
                        1 => '',
                        'invertStateDisplay' => true
                    ]
                ],
            ],
        ],
        'starttime' => [
            'exclude' => true,
            'label' => 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.starttime',
            'config' => [
                'type' => 'input',
                'renderType' => 'inputDateTime',
                'eval' => 'datetime,int',
                'default' => 0,
                'behaviour' => [
                    'allowLanguageSynchronization' => true
                ]
            ],
        ],
        'endtime' => [
            'exclude' => true,
            'label' => 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.endtime',
            'config' => [
                'type' => 'input',
                'renderType' => 'inputDateTime',
                'eval' => 'datetime,int',
                'default' => 0,
                'range' => [
                    'upper' => mktime(0, 0, 0, 1, 1, 2038)
                ],
                'behaviour' => [
                    'allowLanguageSynchronization' => true
                ]
            ],
        ],

        'link' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.link',
            'config' => [
                'type' => 'text',
                'cols' => 40,
                'rows' => 15,
                'eval' => 'trim'
            ]
        ],
        'link_hash' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.link_hash',
            'config' => [
                'type' => 'input',
                'readOnly' => true,
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'link_score_factor' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.link_score_factor',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'double2',
                'default' => 1.0,
            ]
        ],
        'index_ident' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.index_ident',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'index_score_factor' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.index_score_factor',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'default' => 1.0,
                'eval' => 'double2'
            ]
        ],
        'type' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.type',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'grade' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.grade',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'title' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.title',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'description' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.description',
            'config' => [
                'type' => 'text',
                'cols' => 40,
                'rows' => 15,
                'eval' => 'trim'
            ]
        ],
        'crawl_deep' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.crawl_deep',
            'config' => [
                'type' => 'input',
                'readOnly' => true,
                'size' => 4,
                'eval' => 'int'
            ]
        ],
        'crawl_start_link' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.crawl_start_link',
            'config' => [
                'type' => 'text',
                'cols' => 40,
                'readOnly' => true,
                'rows' => 15,
                'eval' => 'trim'
            ]
        ],
        'crawl_connections' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.crawl_connections',
            'config' => [
                'type' => 'input',
                'size' => 4,
                'readOnly' => true,
                'eval' => 'int'
            ]
        ],
        'login_param' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.login_param',
            'config' => [
                'type' => 'flex',
                'ds' => [
                    'default' => 'FILE:EXT:mysearch/Configuration/FlexForms/LinkBase/LoginParam.xml',
                ],
            ]
        ],
        'htaccess_param' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.htaccess_param',
            'config' => [
                'type' => 'flex',
                'ds' => [
                    'default' => 'FILE:EXT:mysearch/Configuration/FlexForms/LinkBase/HtaccessParam.xml',
                ],
            ]
        ],
        'payment_param' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_linkbase.payment_param',
            'config' => [
                'type' => 'flex',
                'ds' => [
                    'default' => 'FILE:EXT:mysearch/Configuration/FlexForms/LinkBase/PaymentParam.xml',
                ],
            ]
        ],

    ],
];
