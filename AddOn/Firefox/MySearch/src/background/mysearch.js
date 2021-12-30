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
    ALL_ALLOWED = '*',
    TEXT_BLACKDOMAINS = 'bing.com|de,' + "\n" +
        'google.' + ALL_ALLOWED + ',' + "\n" +
        'yahoo.com,' + "\n",
    ICON_PATH_ON = "/icons/mysearchon.svg",
    ICON_PATH_OFF = "/icons/mysearchoff.svg";

/**
 * needed for src/content/insert/mysearch.js
 */
const ELASTIC_DOMAIN = 'mysearch.ddev.site',
    ELASTIC_PROTOKOL = 'https://',
    LINKS = 'links',
    LINKGROUP_OWN = 'own',
    LINKGROUP_MENU = 'menu',
    LINKGROUP_FOREIGN = 'foreign',
    FLAG_RESURF = 'flagResurf',
    URI_RESURF = 'uriResurf',
    DOC_KEY = 'docKey',
    INDEX_KEY = 'indexKey',
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
    ID_PING = 'mysearch-ping',
    ID_ON_OFF = 'mysearch-on-off',
    ID_INDEX = 'mysearch-index',
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

/**
 * Default storage-parameter
 */
var defaultSettings = {};
defaultSettings[ID_PING] = true;
defaultSettings[ID_ON_OFF] = false;
defaultSettings[ID_INDEX] = INDEXNAME;
defaultSettings[ID_BLACKLIST] = convertTextToList(TEXT_BLACKDOMAINS);
defaultSettings[ID_BLACKTEXT] = TEXT_BLACKDOMAINS;


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
    browserIconSet(ICON_PATH_ON);

}

function browserIconOff() {
    browserIconSet(ICON_PATH_OFF);
}

// <<< end-Block --- How cann i Import the following code like a module?


// @todo allow the user, to send his datas to an other elastic-server
function getAlternativeElasticServerIndices(defaultDomain) {
    return ELASTIC_PROTOKOL + defaultDomain;
}

// @todo how do i switch the icon to not-allwed, if the Button is set to Notallowed or idf the Site is down
// Listener wont work good
// timeout seems not to work
// I hate javascript :-( The debugging is horrible.
//
// /**
//  * Single -Call for page API to local storage in browser
//  */
// function switchIcon(elasticDomain,settings) {
//     console.log('startSwitch');
//     console.log(elasticDomain);
//     fetch(elasticDomain, {mode: 'no-cors'}).then(r => {
//         if (settings[ID_ON_OFF]) {
//             console.log('active and on');
//             browserIconOn();
//         } else {
//             console.log('active and off');
//             browserIconOff();
//         }
//     }).catch(e => {
//         console.log('in-active');
//         browserIconOff();
//     });
// }
//
//
// /**
//  * Single -Call for page API to local storage in browser
//  */
// function switchBySettings(elasticDomain) {
//     /**
//      * API to local storage in browser
//      */
//     var settingsStored = browser.storage.local.get(STORAGE_KEY_SETTINGS),
//         settings;
//     settingsStored.then((item) => {
//         settings = {...item[STORAGE_KEY_SETTINGS]};
//         switchIcon(elasticDomain, settings);
//     }).catch(() => {
//         settings = {...defaultSettings};
//         switchIcon(elasticDomain, settings);
//     });
//
// }
//
// setTimeout(switchBySettings, 2000,getAlternativeElasticServerIndices(ELASTIC_DOMAIN));

browserIconOn();