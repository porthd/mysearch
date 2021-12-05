<?php

namespace Porthd\Mysearchext\Config;

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

    public const SELF_NAME = 'mysearchext'; // nome of the general basic index
    public const SELF_MAX_RESULT = 50; // nome of the general basic index

    public const ELASTIC_INDEX_DOMAIN_NAME = 'ELASTIC_INDEX_DOMAIN';
    public const ELASTIC_INDEX_DOMAIN_VALUE = 'mysearch.ddev.site';
    public const ELASTIC_INDEX_ROUTE_NAME = 'DOMAIN_NAME';
    public const ELASTIC_INDEX_ROUTE_VALUE = 'http://'.self::ELASTIC_INDEX_DOMAIN_VALUE;
    public const ELASTIC_INDEX_SUB_NAME = 'ELASTIC_INDEX_ROUTE_NAME';
    public const ELASTIC_INDEX_SUB_VALUE = 'search';
    public const GLOBALS_SUBKEY_CUSTOMINDEXER = 'customIndexer';
    public const GLOBALS_SUBKEY_EXCLUDEINDEXER = 'excludeIndexer';
    public const GLOBALS_SUBKEY_CUSTOMRESULTER = 'customResulter';
    public const GLOBALS_SUBKEY_EXCLUDERESULTER = 'excludeResulter';

    public const SELF_DOMAIN_NAME = 'http://mysearchext.ddev.site';
    public const SELF_DOMAIN_ELASTIC_ADDPORT = ':9200';

    public const METHOD_NORMALIZE =  'normalizeRequest';
    public const METHOD_REBUILD =  'rebuildRequest';
    public const METHOD_GET_URLS =  'getUrls';
    public const METHOD_GET_ERRORMESSAGES =  'getErrorMessages';

    public const BASIC_REQUEST_KEY_LIST = [
        'indexKey',
        'docKey',
        'bodyHtml',
        'bodyText',
        'links',
        'headlines',
        ];

    public const INDEX_NAME_BASIC_RESULTER = 'Porthd_Mysearchext_BasicResulter';
    public const INDEX_NAME_BASIC_INDEXER = 'Porthd_Mysearchext_BasicIndexer';

    public const ELASTIC_INDEXER_INDEX = 'index';
    public const ELASTIC_INDEXER_TYPE = 'type';
    public const ELASTIC_INDEXER_ID = 'id';
    public const ELASTIC_INDEXER_BODY = 'body';

    // constants used in the add-on for the JSON-API to the indexer-middle-ware
    public const ADDON_BASIC_INDEXNAME = 'general';
    public const ADDON_BASIC_TYPE_NAME = 'general';
    public const ADDON_BASIC_LINKS = 'links';
    public const ADDON_BASIC_LINKGROUP_OWN = 'own';
    public const ADDON_BASIC_LINKGROUP_MENU = 'menu';
    public const ADDON_BASIC_LINKGROUP_FOREIGN = 'foreign';
    public const ADDON_BASIC_STATUS_NAME = 'status';
    public const ADDON_BASIC_STATUS_OK = 'ok';
    public const ADDON_BASIC_FLAG_RESURF = 'flagResurf';
    public const ADDON_BASIC_URI_RESURF = 'uriResurf';
    public const ADDON_BASIC_DOC_KEY = 'docKey';
    public const ADDON_BASIC_INDEX_KEY = 'indexKey';
    public const ADDON_BASIC_BODY_HTML = 'bodyHtml';
    public const ADDON_BASIC_BODY_TEXT = 'bodyText';
    public const ADDON_BASIC_HEADLINES = 'headlines';
    public const ADDON_BASIC_DUMMYDATA = [
        'links' => [
            'own' => [],
            'menu' => [],
            'foreign' => [],
        ],
        'indexKey' => 'general',
    'docKey' => 'https://test.com/',
            'bodyHtml' => 'Lorem ipsum dolor sit amet',
            'bodyText' => 'Consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc!',
            'headlines' => '<h1>HTML Ipsum Quaerteras</h1>

				<p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>

				<h2>Turpis elit ligula amet  2</h2>

				<ol>
				   <li>U est eget ligula molestie gravida</li>
				   <li>Aliquam tincidunt mauris eu risus.</li>
				</ol>

				<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>

				<h3>Cras in mi at felis 3</h3>

				<ul>
				   <li>Vivamus magna, consectetur adipiscing elit.</li>
				   <li>Mi at felis, tincidunt mauris eu risus.</li>
				</ul>

				<pre><code>
				#header h1 a {
				  display: block;
				  width: 300px;
				  height: 80px;
				}
				</code></pre>',

    ];

    public const TRANS_INDEXER_LIST = 'list';
    public const TRANS_INDEXER_LIST_TEXTFIELDS = [
        self::TRANS_INDEXER_HEADER ,
        self::TRANS_INDEXER_TEXT ,
    ];
    public const TRANS_INDEXER_HEADER = 'header';
    public const TRANS_INDEXER_TEXT = 'text';
    public const TRANS_INDEXER_HTML = 'html';
    public const TRANS_INDEXER_LINKS = 'links';
    public const TRANS_INDEXER_L_FOREIGN = 'foreign';
    public const TRANS_INDEXER_L_OWN = 'own';
    public const TRANS_INDEXER_L_MENU = 'menu';
    // keys neede for the indexer
    public const INDEXER_BASIC_INDEX = 'index';
    public const INDEXER_BASIC_TYPE_KEY = 'type';

    // objekt-key-names for results used in the fluid-template
    public const OUPTUTNAME_BASIC_TITLE = 'title'; //
    public const OUPTUTNAME_BASIC_TEXT = 'text';
    public const OUPTUTNAME_BASIC_LINKS = self::ADDON_BASIC_LINKS;
    public const OUPTUTNAME_BASIC_LINKGROUP_OWN = self::ADDON_BASIC_LINKGROUP_OWN;
    public const OUPTUTNAME_BASIC_LINKGROUP_MENU = self::ADDON_BASIC_LINKGROUP_MENU;
    public const OUPTUTNAME_BASIC_LINKGROUP_FOREIGN = self::ADDON_BASIC_LINKGROUP_FOREIGN;
    public const OUPTUTNAME_BASIC_QUOTES = 'searchQuotes';

}
