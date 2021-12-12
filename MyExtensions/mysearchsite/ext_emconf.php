<?php

/**
 * Extension Manager/Repository config file for ext "mysearch".
 */
$EM_CONF[$_EXTKEY] = [
    'title' => 'MySearchsite - TYPO3-Extension for the local website, which may contain your personal search-engine',
    'description' => 'This extension contain the configurations and definition, which are needed for your personal search-engine-website on your local computer.',
    'category' => 'templates',
    'constraints' => [
        'depends' => [
            'bootstrap_package' => '11.5.0-11.5.99',
            'typo3' => '11.5.0-11.5.99',
        ],
        'conflicts' => [
        ],
    ],
    'autoload' => [
        'psr-4' => [
            'Private\\Mysearchsite\\' => 'Classes',
        ],
    ],
    'state' => 'stable',
    'uploadfolder' => 0,
    'createDirs' => '',
    'clearCacheOnLoad' => 1,
    'author' => 'Dr. Dieter Porth',
    'author_email' => 'info@mobger.de',
    'author_company' => 'private',
    'version' => '11.1.0',
];
