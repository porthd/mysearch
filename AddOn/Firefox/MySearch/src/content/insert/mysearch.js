/** @todo listings
 *  - allow the user, to send his datas to an other elastic-server
 *  - show offline-Icon, if elastic-search is offline
 *  - show separated Popup, if searchindex is offline
 *  - How can i Import the following code like a module?
 */

// @todo- How can I import the following code like a module? >>> Start-Block
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
    INDEX_KEY = 'indexKey'
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
    let rawList = listText.split(/[\n,]/) ?? [],
        resultList = [];
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
            resultList.push(check);
        }
    });

    return resultList;
}

/**
 *
 * Default storage-parameter
 */
var defaultSettings = {};
defaultSettings[ID_PING] = true;
defaultSettings[ID_ON_OFF] = false;
defaultSettings[ID_INDEX] = INDEXNAME;
defaultSettings[ID_BLACKLIST] = convertTextToList(TEXT_BLACKDOMAINS);
defaultSettings[ID_BLACKTEXT] = TEXT_BLACKDOMAINS;


// <<< end-Block --- How cann i Import the following code like a module?

// @todo allow the user, to send his datas to an other elastic-server
function getAlternativeElasticServerSearch(defaultServer) {
    return ELASTIC_PROTOKOL + ELASTIC_DOMAIN + '/search/'; // push the data to the TYPO3-middleware
}


function markDocumentWorkupBorderStatus(color) {
    document.body.style.border = BORDER_DOC_WORKUP + ' ' + color + ' ';
}

function postAjax(url, data) {
    var jsonData = new FormData();
    jsonData.append("json", JSON.stringify(data));
    console.log(url);
    return fetch(url, {
        method: "POST",
        headers: {
            'Accept': 'application/json, text/plain, */*',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data),
    }).then((response) => {
        markDocumentWorkupBorderStatus(BORDER_DOC_SUCCESS); // sign success
        return response.json();
    }).then((data) => {
        if ((data[FLAG_RESURF]) && (data[URI_RESURF])) {
            console.log(data[URI_RESURF] + ' resurf-data');
            /**
             * surf one more time. => this is the part for your search-robot, if you want that.
             * remeber: you should respect the robots.txt and the restrictions ind the meta-datas of the
             * current html-website.
             */
            markDocumentWorkupBorderStatus(BORDER_DOC_NOT_WORKED_YET);
            document.location.href = data[URI_RESURF];
        } else {
            markDocumentWorkupBorderStatus(BORDER_DOC_SUCCESS);
        }
    }).catch(function (error) {
        if (!!error) {
            markDocumentWorkupBorderStatus(BORDER_DOC_FAILED);
            console.log('A postAjax: MySearch-AddOn with following object of error. ');
            console.log('MySearch-AddOn-Error: ' + "\n" + 'Not Started ElasticSearch => (bash/console/pcshell:ddev restart) ' +
                "\n" + 'Unwished indexing? => Deactivate it. '+
                '(For developer) Perhaps there is an javascript or an error in the middleware [php] error. Check it');
            console.log(error);
        }
    });

}

function getLinkList() {
    let linksRawList = Array.from(document.links) ?? [],
        linkList = {},
        baseHref = document.location.href;

    linkList[LINKGROUP_OWN] = [];
    linkList[LINKGROUP_MENU] = [];
    linkList[LINKGROUP_FOREIGN] = [];

    linksRawList.forEach(elem => {
        let protocol = elem.protocol.toLowerCase();
        if (['http:', 'https:', 'file:'].includes(protocol)) {
            let hash = elem.hash ? '#' + elem.hash : '',
                search = elem.search ? elem.search : '',
                href = elem.protocol + "//" + elem.host + elem.pathname + search + hash;
            if ((href !== baseHref)
            ) {
                let name = (elem.innerText ?
                            elem.innerText :
                            '???'
                    ),
                    id = (elem.id ? elem.id : ''),
                    className = (elem.className ? elem.className : ''),
                    flagMenu = false;
                ['nav', 'menu', 'head', 'foot'].forEach(part => {
                    flagMenu = flagMenu || id.includes('part') ||
                        className.includes('part');
                });

                if (elem.host === document.location.host) {
                    if (flagMenu) {
                        linkList[LINKGROUP_MENU].push({
                            name: name,
                            uri: href,
                            path: elem.pathname
                        });
                    } else {
                        linkList[LINKGROUP_OWN].push({
                            name: name,
                            uri: href,
                            path: elem.pathname
                        });

                    }
                } else {
                    linkList[LINKGROUP_FOREIGN].push({
                        name: name,
                        uri: href,
                        path: elem.pathname
                    });
                }
            }
        }
    });

    return linkList;
}

function getIndexListFromStorage(indexName) {
    return indexName ?? INDEXNAME;
}


function getHeadlineList() {
    let list = document.body.querySelectorAll('h1,h2,h3,h4'),
        result = [];
    if (list.length > 0) {
        Array.from(list).forEach((elem) => {
            let dummy = elem.innerText.trim();
            if (dummy !== '') {
                result[result.length] = dummy;
            }
        });
    }
    return result;

}

// @todo: This function should contain a individual blacklist, It should be part of a file with domainnames
function domainInBlacklist(testUriRaw, mySettings) {
    let parts = testUriRaw.hostname.toLowerCase().split('.'),
        list = mySettings[ID_BLACKLIST],
        firstTest = (parts[(parts.length - 1)] ?? ''),
        secondTest = (parts[(parts.length - 2)] ?? ''),
        flag = false,
        flagFirst, flagSecond, checkFirst, checkSecond;
    console.log('list'+firstTest);
    console.log('list' + secondTest);
    if (!Array.isArray(list)) {
        list = convertTextToList(defaultSettings[ID_BLACKTEXT]);
    }
    console.log(list );
    list.forEach((item) => {
        if (!flag) {
            flagFirst = false;
            flagSecond = false;
            checkFirst = item[ID_BLACKTEST_FIRST];
            checkSecond = item[ID_BLACKTEST_SECOND];

            if (firstTest === '') {
                flagFirst = true;
            } else {
                if (Array.isArray(checkFirst)) {
                    flagFirst = checkFirst.includes(firstTest) || checkFirst.includes('*');
                } else {
                    flagFirst = (checkFirst === firstTest) || (checkFirst === '*') || (checkFirst=== true);
                }
            }
            if (secondTest === '') {
                flagSecond = true;
            } else {
                if (Array.isArray(checkSecond)) {
                    flagSecond = checkSecond.includes(secondTest) || checkSecond.includes('*');
                } else {
                    flagSecond = (checkSecond === secondTest) || (checkSecond ==='*') || (checkSecond === true);
                }
            }
            console.log('check first second ' + firstTest + ' - '+secondTest);
            console.log(checkFirst );
            console.log(checkSecond);
            flag = flag || (
                flagFirst && flagSecond
            );
            console.log('flag '+(flag?'true':'false') + 'für '+ secondTest+ '.'+firstTest);
        }

    })
    return flag || (testUriRaw.hostname.indexOf(ELASTIC_DOMAIN) !== -1);
}

function dataForIndex(uri, index, elasticServer) {
    // parameter of content listed in file \web\typo3conf\ext\mysearch\Classes\Config\SelfConst.php for check-proposes
    let content = {};
    content[DOC_KEY] = uri['protocol'] + "//" + uri['hostname'] + (!uri['port'] ? ':' + uri['port'] : '') + uri['pathname'] + uri['search'] + uri['hash'];
    content[INDEX_KEY] = index;
    content[BODY_HTML] = document.body.innerHTML;
    content[BODY_TEXT] = document.body.innerText;
    content[LINKS] = getLinkList();
    content[HEADLINES] = getHeadlineList();
    postAjax(elasticServer, content);
}

function initPage(mySettings) {
    if (!!mySettings[ID_ON_OFF]) {
        markDocumentWorkupBorderStatus(BORDER_DOC_NOT_WORKED_YET);
        let uri = document.location,
            myElasticServer = getAlternativeElasticServerSearch(ELASTIC_DOMAIN);

        if (domainInBlacklist(uri, mySettings)) {
            markDocumentWorkupBorderStatus(BORDER_DOC_BLACKLISTED); // sign failure of blacklist
        } else {
            console.log('register');
            let index = getIndexListFromStorage(mySettings[ID_INDEX]);
            if (index) {
                dataForIndex(uri, index,  myElasticServer);
            }
            markDocumentWorkupBorderStatus(BORDER_DOC_IN_PROGRESS); // sign failure of blacklist
        }
    } else {
        console.log('nothing to do');
        markDocumentWorkupBorderStatus(BORDER_DOC_NOT_ACTIVE); // sign failure of blacklist
    }
}

/**
 * Single -Call for page API to local storage in browser
 */
var settingsStored = browser.storage.local.get(STORAGE_KEY_SETTINGS);
settingsStored.then((item) => {
    if (!item) {
        initPage(defaultSettings);
    } else {
        initPage(item[STORAGE_KEY_SETTINGS]);
    }
}).catch((err) => {
    if (!err) {

        console.log('Ends without error.');
    } else {
        console.log('Stop, there was an error:' + "\n" + err);
    }
});
