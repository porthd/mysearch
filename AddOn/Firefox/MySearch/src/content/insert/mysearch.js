const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

const LINKS = 'links',
    LINKGROUP_OWN = 'own',
    LINKGROUP_MENU = 'menu',
    LINKGROUP_FOREIGN = 'foreign',
    INDEXNAME = 'general',
    FLAG_RESURF = 'flagResurf',
    URI_RESURF = 'uriResurf',
    DOC_KEY = 'docKey',
    INDEX_KEY = 'indexKey',
    BODY_HTML = 'bodyHtml',
    BODY_TEXT = 'bodyText',
    HEADLINES = 'headlines',
    BORDER_DOC_WORKUP = 'solid 5px', // used in `markDocumentWorkupBorderStatus`
    BORDER_DOC_NOT_WORKED_YET = 'orange', // used in `markDocumentWorkupBorderStatus`
    BORDER_DOC_FAILED = 'palevioletred',
    BORDER_DOC_SUCCESS = 'green',
    BORDER_DOC_BLACKLISTED = 'black',
    dummy = true;


function markDocumentWorkupBorderStatus(color) {
    document.body.style.border = BORDER_DOC_WORKUP + ' ' + color + ' ';
}

function postAjax(url, data) {
    var jsonData = new FormData();
    jsonData.append("json", JSON.stringify(data));
    return fetch(url, {
        method: "POST",
        headers: {
            'Accept': 'application/json, text/plain, */*',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data),
    }).then((response) => {
        console.log(response);
        markDocumentWorkupBorderStatus(BORDER_DOC_SUCCESS); // sign success
        return response.json();
    }).then((data) => {
        if ((data[FLAG_RESURF]) && (data[URI_RESURF])) {
            markDocumentWorkupBorderStatus(BORDER_DOC_NOT_WORKED_YET);
            document.location.href = data[URI_RESURF];
        } else {
            markDocumentWorkupBorderStatus(BORDER_DOC_SUCCESS);
        }
    }).catch(function (error) {
        markDocumentWorkupBorderStatus(BORDER_DOC_FAILED);
        console.log('A postAjax: MySearch-AddOn with following object of error');
        console.log(error);
    });

}

function getLinkList() {
    let list = Array.from(document.links),
        result = {},
        baseHref = document.location.href;

    result[LINKGROUP_OWN] = [];
    result[LINKGROUP_MENU] = [];
    result[LINKGROUP_FOREIGN] = [];

    list.forEach(elem => {
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
                        result[LINKGROUP_MENU][result[LINKGROUP_MENU].length] = {
                            name: name,
                            uri: href,
                            path: elem.pathname
                        };
                    } else {
                        result[LINKGROUP_OWN][result[LINKGROUP_OWN].length] = {
                            name: name,
                            uri: href,
                            path: elem.pathname
                        };

                    }
                } else {
                    result[LINKGROUP_FOREIGN][result[LINKGROUP_FOREIGN].length] = {
                        name: name,
                        uri: href,
                        path: elem.pathname
                    };
                }
            }
        }
    });

    return result;
}

// @todo add a logik to allow/unallow the index
function getIndexListFromStorage() {
    return INDEXNAME;
}

function getHeadlineList() {
    let list = document.body.querySelectorAll('h1,h2,h3,h4'),
        result = [];

    Array.from(list).forEach((elem) => {
        let dummy = elem.innerText.trim();
        if (dummy !== '') {
            result[result.length] = dummy;
        }
    });

    return result;

}

// @todo: This function should contain a individual blacklist, It should be part of a file with domainnames
function domainInBlacklist(testUriRaw) {
    let testUri = testUriRaw.hostname.toLowerCase(),
        flag = false,
        list = ['www.bing.com', 'www.bing.de', 'www.google.com', 'www.google.de',];

    flag = flag || (testUri === 'mysearch.ddev.site');
    flag = flag || checkDomainInList(testUri, list);
    return flag;
}

// @todo: the flaglist should allow the detection of regular expressions like '*.google.(de|com|org|gov)'
function checkDomainInList(testUriRaw, list) {
    return list.includes(testUriRaw);
}

function dataForIndex(uri, index) {
    // parameter of content listed in file \web\typo3conf\ext\mysearch\Classes\Config\SelfConst.php for check-proposes
    let content = {};

    content[DOC_KEY] = uri['protocol'] + "//" + uri['hostname'] + (!uri['port'] ? ':' + uri['port'] : '') + uri['pathname'] + uri['search'] + uri['hash'];
    content[INDEX_KEY] = index;
    content[BODY_HTML] = document.body.innerHTML;
    content[BODY_TEXT] = document.body.innerText;
    content[LINKS] = getLinkList();
    content[HEADLINES] = getHeadlineList();
    postAjax(ELASTIC_LOCAL_URL, content);

}



// initial color
markDocumentWorkupBorderStatus(BORDER_DOC_NOT_WORKED_YET);

let uri = document.location;
if (domainInBlacklist(uri)) {
    markDocumentWorkupBorderStatus(BORDER_DOC_BLACKLISTED); // sign failure of blacklist
} else {
    let index = getIndexListFromStorage();
    if (index) {
        dataForIndex(uri, index);
    }
}
markDocumentWorkupBorderStatus('blue'); // sign failure of blacklist
