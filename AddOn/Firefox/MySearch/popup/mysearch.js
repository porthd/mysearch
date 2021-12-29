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
        'yahoo.com,' + "\n",
    ICON_PATH_ON = "/icons/mysearchon.svg",
    ICON_PATH_OFF = "/icons/mysearchoff.svg";

/**
 * needed for src/content/insert/mysearch.js
 */
const ELASTIC_DOMAIN = 'mysearch.ddev.site',
    // ELASTIC_PORT = ':9200',
    ELASTIC_PORT = '',
    ELASTIC_PROTOKOL = 'https://',
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
    ID_PING = 'mysearch-ping',
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

/**
 *
 * Default storage-parameter
 */
var defaultSettings = {};
defaultSettings[ID_PING] = true;
defaultSettings[ID_ON_OFF] = false;
defaultSettings[ID_INDEX] = INDEXNAME;
defaultSettings[ID_TYPE] = TYPENAME;
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

/**
 * Single -Call for page API to local storage in browser
 */
function switchIcon(elasticDomain, settings) {
    var settingsStored = browser.storage.local.get(STORAGE_KEY_SETTINGS);
    settingsStored.then((item) => {
        if (!item) {
            if ((settings[ID_ON_OFF]) && (settings[ID_PING])){
                browserIconOn();
            } else {
                browserIconOff();
            }
        } else {
            if ((!!item[STORAGE_KEY_SETTINGS][ID_ON_OFF]) &&
                (!!item[STORAGE_KEY_SETTINGS][ID_PING])
            ) {
                browserIconOn();
            } else {
                browserIconOff();
            }
        }
    }).catch((err) => {
        if (!err) {
            console.log('Ends without error.');
        } else {
            browserIconOff();
            console.log('Stop, there was an error:' + "\n" + err);
        }
    });
}

// <<< end-Block --- How cann i Import the following code like a module?


// @todo allow the user, to send his datas to an other elastic-server
function getAlternativeElasticServerIndices(defaultDomain) {
    // return 'https://'+defaultDomain+'/_cat/indices/';
    return     ELASTIC_PROTOKOL +defaultDomain+    ELASTIC_PORT +'/_cat/indices/';
}

/**
 *
 * Default storage-parameter
 */
var mySettings = {...defaultSettings};



/**
 *
 * Needed DOM-Objects
 */
var $myLocation = {};
$myLocation[ID_ON_OFF] = document.getElementById(ID_ON_OFF);
$myLocation[ID_INDEX] = document.getElementById(ID_INDEX);
$myLocation[ID_TYPE] = document.getElementById(ID_TYPE);
$myLocation[ID_BLACKTEXT] = document.getElementById(ID_BLACKTEXT);

function updateView() {
    $myLocation[ID_ON_OFF].checked = (!!mySettings[ID_ON_OFF]);
    $myLocation[ID_INDEX].value = (mySettings[ID_INDEX] ?? INDEXNAME);
    $myLocation[ID_TYPE].value = (mySettings[ID_TYPE] ?? TYPENAME);
    $myLocation[ID_BLACKTEXT].value = (mySettings[ID_BLACKTEXT] ?? TEXT_BLACKDOMAINS);
}

/**
 * API to local storage in browser
 */
var settingsStored = browser.storage.local.get(STORAGE_KEY_SETTINGS);
settingsStored.then((item) =>{
    mySettings = {...item[STORAGE_KEY_SETTINGS]};
    updateView();
}).catch(() =>{
    mySettings = {...defaultSettings};
    updateView();
});

/**
 * eventhandling for changes in the local storage with the sttings-plugin
 */
function getSettings() {
    let localSettings = browser.storage.local.get(STORAGE_KEY_SETTINGS);
    localSettings.then((item) => {
        mySettings = {...item[STORAGE_KEY_SETTINGS]};
        updateView();
    }).catch(() => {
        mySettings = {...defaultSettings};
        updateView();
    })
}

function setSettings( key, value) {
    if (key === ID_BLACKTEXT) {
        mySettings[ID_BLACKTEXT] = value;
        mySettings[ID_BLACKLIST] = convertTextToList(value);
    } else {
        mySettings[key] = value;
    }
    let help = {};
    help[STORAGE_KEY_SETTINGS] = {...mySettings};
    browser.storage.local.set(help);
}


function changeSwitchSettings(settings,location) {
    let onSearch = (!!document.getElementById(ID_ON_OFF).checked);
    console.log('Check ' + (onSearch ? 'true' : 'false'));
    setSettings(ID_ON_OFF, onSearch);
    updateView();
}

function changeTypeSettings() {
    let typeName = document.getElementById(ID_TYPE).value ?? TYPENAME;
    setSettings( ID_TYPE, typeName);
    updateView();
}

function changeIndexSettings(settings,location) {
    let indexName = document.getElementById(ID_INDEX).value ?? INDEXNAME;
    setSettings( ID_INDEX, indexName);
    updateView();
}

function changeBlacklistSettings(settings,location) {
    let rawTextListing = ((document.getElementById(ID_BLACKTEXT).value !== '') ?
            document.getElementById(ID_BLACKTEXT).value :
            TEXT_BLACKDOMAINS
    );
    console.log('rawTextListing\n' + rawTextListing);
    setSettings(ID_BLACKTEXT, rawTextListing);
    updateView();
}

function initValues() {
    $myLocation[ID_ON_OFF].addEventListener('change', ()=> {
        changeSwitchSettings()
    });
    $myLocation[ID_TYPE].addEventListener('change', () => {
        changeTypeSettings();
    });
    $myLocation[ID_INDEX].addEventListener('change', () => {
        changeIndexSettings();
    });
    $myLocation[ID_BLACKTEXT].addEventListener('change', () => {
        changeBlacklistSettings();
    });
    getSettings();
}

document.addEventListener('DOMContentLoaded', () => {
    initValues()
});


window.addEventListener('blur', function (event) {
    let uri = getAlternativeElasticServerIndices(ELASTIC_DOMAIN);
    fetch(uri, {
        method: "GET",
        headers: {
            'Accept': 'application/json, text/plain, */*',
            'Content-Type': 'application/json'
        }
    }).then(function(response) {
        setSettings(ID_PING, (response.status === 200));
    });
});