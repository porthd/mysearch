<?php

namespace Porthd\Mysearch\Config;

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

class SelfConst
{

    public const SELF_NAME = 'mysearch'; // nome of the general basic index
    public const SELF_DEFAULT_INDEX = 'general'; // nome of the general basic index
    public const SELF_MAX_RESULT = 50; // nome of the general basic index

    public const ELASTIC_INDEX_ROUTE_NAME = 'search';
    public const GLOBALS_SUBKEY_CUSTOMINDEXER = 'customIndexer';
    public const GLOBALS_SUBKEY_EXCLUDEINDEXER = 'excludeIndexer';
    public const GLOBALS_SUBKEY_CUSTOMRESULTER = 'customResulter';
    public const GLOBALS_SUBKEY_EXCLUDERESULTER = 'excludeResulter';

    public const SELF_DOMAIN_NAME = 'http://mysearch.ddev.site';
    public const SELF_DOMAIN_ELASTIC_ADDPORT = ':9200';

    public const METHOD_NORMALIZE =  'normalizeRequest';
    public const METHOD_REBUILD =  'rebuildRequest';
    public const METHOD_GET_URLS =  'getUrls';
    public const METHOD_GET_ERRORMESSAGES =  'getErrorMessages';

    public const BASIC_REQUEST_KEY_LIST = [
        'index',
        'type',
        'body',
        'bodyText',
        'links',
        'headlines',
        ];

}
