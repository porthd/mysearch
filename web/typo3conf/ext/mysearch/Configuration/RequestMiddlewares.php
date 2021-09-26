<?php

return [
    'frontend' => [
        'porthd/mysearch/index-mysearch-to-elastic' => [
            'target' => Porthd\Mysearch\Middleware\IndexMysearchToElasticMiddleware::class,
            'after' => [
                'typo3/cms-frontend/backend-user-authentication',
                'typo3/cms-frontend/authentication'
            ],
            'before' => [
                'typo3/cms-adminpanel/initiator',
            ],
        ],
    ],
];
