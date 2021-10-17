const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

const LINKS = 'links',
    LINKGROUP_OWN = 'own',
    LINKGROUP_MENU = 'menu',
    LINKGROUP_FOREIGN = 'foreign',
    INDEXNAME = 'general',
    FLAG_RESURF = 'flagResurf',
    URI_RESURF = 'uriResurf',
    INDEX = 'index',
    TYPE_KEY = 'type',
    BODY_HTML = 'bodyHtml',
    BODY_TEXT = 'bodyText',
    HEADLINES = 'headlines';



document.body.style.border = "5px solid orange";

let uri = document.location;
if (domainInBlacklist(uri)) {
    console.log('failed');
    document.body.style.border = "5px solid red";
} else {
    dataForIndex();
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
        console.log('postAjax MySearch-AddOn: response-Urls perhaps for next requests');
        document.body.style.border = "5px solid green";
        console.log(response);
        return response.json();
    }).then((data) => {
        if ((data[FLAG_RESURF]) && (data[URI_RESURF])) {
            document.body.style.border = "5px solid orange";
            console.log('postAjax MySearch-AddOn: resurf to url:' + data[URI_RESURF]);
            document.location.href = data[URI_RESURF];
        } else {
            console.log('postAjax MySearch-AddOn: nothing more to do');
            document.body.style.border = "5px solid green";
        }
    }).catch(function (error) {
        document.body.style.border = "5px solid  palevioletred";
        console.log('postAjax MySearch-AddOn with following object of error');
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

function domainInBlacklist(testUriRaw) {
    let testUri = testUriRaw.hostname.toLowerCase(),
        flag = false;
    flag = flag || (testUri === 'mysearch.ddev.site');
    flag = flag || (['www.bing.com', 'www.bing.de', 'www.google.com', 'www.google.de',].includes(testUri));
    return flag;
}

function dataForIndex() {
    // parameter of content listed in file \web\typo3conf\ext\mysearch\Classes\Config\SelfConst.php for check-proposes
    let uri = document.location,
        content = {};

    content[INDEX] = uri['protocol'] + "//" + uri['hostname'] + (!uri['port'] ? ':' + uri['port'] : '') + uri['pathname'] + uri['search'] + uri['hash'],
        content[TYPE_KEY] = getIndexListFromStorage(),
        content[BODY_HTML] = document.body.innerHTML,
        content[BODY_TEXT] = document.body.innerText,
        content[LINKS] = getLinkList(),
        content[HEADLINES] = getHeadlineList(),

        postAjax(ELASTIC_LOCAL_URL, content);

}

