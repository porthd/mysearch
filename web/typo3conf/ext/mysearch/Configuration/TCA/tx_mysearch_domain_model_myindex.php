<?php
return [
    'ctrl' => [
        'title' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex',
        'label' => 'name',
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
        'searchFields' => 'name,vendor,description,index_ident,title_trans_key,description_trans_key,linkbase_files_folder,default_type,default_grade',
        'iconfile' => 'EXT:mysearch/Resources/Public/Icons/tx_mysearch_domain_model_myindex.gif'
    ],
    'interface' => [
        'showRecordFieldList' => 'sys_language_uid, l10n_parent, l10n_diffsource, hidden, name, vendor, description, index_ident, index_score_factor, title_trans_key, description_trans_key, linkbase_files_folder, default_type, default_grade',
    ],
    'types' => [
        '1' => ['showitem' => 'sys_language_uid, l10n_parent, l10n_diffsource, hidden, name, vendor, description, index_ident, index_score_factor, title_trans_key, description_trans_key, linkbase_files_folder, default_type, default_grade, --div--;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:tabs.access, starttime, endtime'],
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
                'foreign_table' => 'tx_mysearch_domain_model_myindex',
                'foreign_table_where' => 'AND {#tx_mysearch_domain_model_myindex}.{#pid}=###CURRENT_PID### AND {#tx_mysearch_domain_model_myindex}.{#sys_language_uid} IN (-1,0)',
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

        'name' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.name',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'vendor' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.vendor',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'description' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.description',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'index_ident' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.index_ident',
            'config' => [
                'type' => 'input',
                'readOnly' => true,
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'index_score_factor' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.index_score_factor',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'double2'
            ]
        ],
        'title_trans_key' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.title_trans_key',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'description_trans_key' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.description_trans_key',
            'config' => [
                'type' => 'text',
                'cols' => 40,
                'rows' => 15,
                'eval' => 'trim'
            ]
        ],
        'linkbase_files_folder' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.linkbase_files_folder',
            'config' => [
                'type' => 'text',
                'cols' => 40,
                'rows' => 15,
                'eval' => 'trim'
            ]
        ],
        'default_type' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.default_type',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'default_grade' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.default_grade',
            'config' => [
                'type' => 'input',
                'size' => 30,
                'eval' => 'trim'
            ],
        ],
        'login_param' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.login_param',
            'config' => [
                'type' => 'flex',
                'ds' => [
                    'default' => 'FILE:EXT:mysearch/Configuration/FlexForms/LinkBase/LoginParam.xml',
                ],
            ]
        ],
        'htaccess_param' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.htaccess_param',
            'config' => [
                'type' => 'flex',
                'ds' => [
                    'default' => 'FILE:EXT:mysearch/Configuration/FlexForms/LinkBase/HtaccessParam.xml',
                ],
            ]
        ],
        'payment_param' => [
            'exclude' => true,
            'label' => 'LLL:EXT:mysearch/Resources/Private/Language/locallang_db.xlf:tx_mysearch_domain_model_myindex.payment_param',
            'config' => [
                'type' => 'flex',
                'ds' => [
                    'default' => 'FILE:EXT:mysearch/Configuration/FlexForms/LinkBase/PaymentParam.xml',
                ],
            ]
        ],

    ],
];
