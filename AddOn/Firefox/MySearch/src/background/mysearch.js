/**
 * @todo listing
 * - show offline-Icon, if elastic-search is offline
 * - show Popup with error-hints an suggestion, if searchindex is offline
 * - How cann i Import the following code like a module?
 */

// @todo- How cann i Import the following code like a module? >>> Start-Block
/**
 * needed for BOTH src/content/insert/mysearch.js and popup/mysearch.js
 */
const INDEXNAME = 'general',
    TYPENAME = 'general',
    ALL_ALLOWED = '*',
    TEXT_BLACKDOMAINS = 'bing.com|de,' + "\n" +
        'google.' + ALL_ALLOWED + ',' + "\n" +
        'yahoo.com,' + "\n";

/**
 * needed for src/content/insert/mysearch.js
 */
const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/',
    ELASTIC_DOMAIN = 'mysearch.ddev.site',
    LINKS = 'links',
    LINKGROUP_OWN = 'own',
    LINKGROUP_MENU = 'menu',
    LINKGROUP_FOREIGN = 'foreign',
    FLAG_RESURF = 'flagResurf',
    URI_RESURF = 'uriResurf',
    DOC_KEY = 'docKey',
    INDEX_KEY = 'indexKey',
    TYPE_KEY = 'typeKey',
    BODY_HTML = 'bodyHtml',
    BODY_TEXT = 'bodyText',
    HEADLINES = 'headlines',
    BORDER_DOC_WORKUP = 'solid 5px', // used in `markDocumentWorkupBorderStatus`
    BORDER_DOC_NOT_WORKED_YET = 'orange', // used in `markDocumentWorkupBorderStatus`
    BORDER_DOC_IN_PROGRESS = 'khaki', // used in `markDocumentWorkupBorderStatus`
    BORDER_DOC_FAILED = 'darkmagenta',
    BORDER_DOC_SUCCESS = 'green',
    BORDER_DOC_NOT_ACTIVE = 'blue',
    BORDER_DOC_BLACKLISTED = 'black';

/**
 * needed for popup/mysearch.js
 */
const STORAGE_KEY_SETTINGS = 'mySettings',
    ID_ON_OFF = 'mysearch-on-off',
    ID_INDEX = 'mysearch-index',
    ID_TYPE = 'mysearch-type',
    ID_BLACKLIST = 'mysearch-blacklist',
    ID_BLACKTEXT = 'mysearch-blacktext',
    ID_BLACKTEST_FIRST = 'first',
    ID_BLACKTEST_SECOND = 'second';


function convertTextToList(listText) {
    let rawList = listText.split(/[\n,]/),
        list = [];
    rawList.forEach(item => {
        let test = item.trim().toLowerCase();
        if (item !== '') {
            let parts = test.split('.'),
                firstLevel = (parts[(parts.length - 1)] ?? ''),
                secondLevel = (parts[(parts.length - 2)] ?? ''),
                check = {};
            check[ID_BLACKTEST_FIRST] = firstLevel;
            check[ID_BLACKTEST_SECOND] = secondLevel;

            if (firstLevel === ALL_ALLOWED) {
                check[ID_BLACKTEST_FIRST] = true;
            } else if (firstLevel.indexOf('|') !== -1) {
                check[ID_BLACKTEST_FIRST] = firstLevel.replace(/\s/g, '').split('|');
            }
            if (secondLevel === ALL_ALLOWED) {
                check[ID_BLACKTEST_SECOND] = true;
            } else if (secondLevel.indexOf('|') !== -1) {
                check[ID_BLACKTEST_SECOND] = secondLevel.replace(/\s/g, '').split('|');
            }
            list.push(check);
        }
    });

    return list;
}

// @todo allow the user, to send his datas to an other elastic-server
function getAlternativeElasticServer(defaultServer) {
    return defaultServer;
}

/**
* Default storage-parameter
*/
var defaultSettings = {};
defaultSettings[ID_PING] = true;
defaultSettings[ID_ON_OFF] = false;
defaultSettings[ID_INDEX] = INDEXNAME;
defaultSettings[ID_TYPE] = TYPENAME;
defaultSettings[ID_BLACKLIST] = convertTextToList(TEXT_BLACKDOMAINS);
defaultSettings[ID_BLACKTEXT] = TEXT_BLACKDOMAINS;

// <<< end-Block --- How cann i Import the following code like a module?

function browserIconSet(svgPath) {
    browser.browserAction.setIcon({
        path: {
            "16": svgPath,
            "19": svgPath,
            "32": svgPath,
            "48": svgPath,
            "128": svgPath,
        }
    });
}
function browserIconOn() {
    browserIconSet("/icons/mysearchon.svg");

}

function browserIconOff() {
    browserIconSet("/icons/mysearchoff.svg");
}


browserIconOff();
let eleasticDomain = getAlternativeElasticServer();
// switchIconIfOffline(elasticDomain);

// /**
//  * Single -Call for page API to local storage in browser
//  */
// var settingsStored = browser.storage.local.get(STORAGE_KEY_SETTINGS);
// settingsStored.then((item) => {
//     if (!item) {
//         if (defaultSettings[ID_ON_OFF]) {
//             switchIconIfOffline(elasticDomain);
//         } else {
//             browserIconOff();
//         }
//     } else {
//         if (!!item[STORAGE_KEY_SETTINGS][ID_ON_OFF]) {
//             switchIconIfOffline(elasticDomain);
//         } else {
//             browserIconOff();
//         }
//     }
// }).catch((err) => {
//     if (!err) {
//
//         console.log('Ends without error.');
//     } else {
//         browserIconOff();
//         console.log('Stop, there was an error:' + "\n" + err);
//     }
// });