<?php

return [
    'frontend' => [
        'porthd/mysearchext/index-mysearchext-to-elastic' => [
            'target' => Porthd\Mysearchext\Middleware\IndexMysearchextToElasticMiddleware::class,
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
