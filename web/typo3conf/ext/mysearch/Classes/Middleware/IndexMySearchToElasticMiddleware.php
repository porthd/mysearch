<?php

namespace Porthd\Mysearch\Middleware;

/***************************************************************
 *
 *  Copyright notice
 *
 *  (c) 2021 Dr. Dieter Porth <info@mobger.de>
 *
 *  All rights reserved
 *
 *  This script is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  The GNU General Public License can be found at
 *  http://www.gnu.org/copyleft/gpl.html.
 *
 *  This copyright notice MUST APPEAR in all copies of the script!
 ***************************************************************/


use Porthd\Mysearch\Config\SelfConst;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;
use TYPO3\CMS\Core\Http\ResponseFactory;
use TYPO3\CMS\Core\Utility\GeneralUtility;

/**
 * Class ResourcesForFrontendEditing
 * This extension add some needed styles and javascript-codes to the rendered page
 */
class IndexMySearchToElasticMiddleware implements MiddlewareInterface
{

    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {
        if ($request->getAttribute('normalizedParams')->getRequestUri() === SelfConst::ELASTIC_INDEX_ROUTE_NAME) {
            $responseFactory = GeneralUtility::makeInstance(ResponseFactory::class);
            $response = $responseFactory->createResponse();
            $response->withStatus(200, 'Content-editing is remove.')
                ->withHeader('Content-Type', 'application/json; charset=utf-8')
                ->getBody()->write(
                    json_encode([
                        'status' => 'ok',
                    ])
                );
            return $response;

        }
        return $handler->handle($request);
    }

}
