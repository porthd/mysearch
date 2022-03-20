<?php

/***************************************************************
 * Extension Manager/Repository config file for ext: "mysearchext"
 *
 * Auto generated by Extension Builder 2020-08-27
 *
 * Manual updates:
 * Only the data in the array - anything else is removed by next write.
 * "version" and "dependencies" must not be touched!
 ***************************************************************/

$EM_CONF[$_EXTKEY] = [
    'title' => 'Mysearchext - Extension for the TYPO3-Elasticsearch-Communication',
    'description' => 'The Extension controlls the middleware, which receive some datas from your browser-plugin and '.
        'send the data after refactoring to your elastic-search-server. The Extension controlls the plugin, which receive '.
    'search-request data from you local search-page and show you the result of your requests.',
    'category' => 'plugin',
    'author' => 'Dr. Dieter Porth',
    'author_email' => 'info@mobger.de',
    'state' => 'alpha',
    'uploadfolder' => 0,
    'createDirs' => '',
    'clearCacheOnLoad' => 0,
    'version' => '11.1.1',
    'constraints' => [
        'depends' => [
            'typo3' => '11.5.0-11.5.99',
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
];
