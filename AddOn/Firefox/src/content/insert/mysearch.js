const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

document.body.style.border = "5px solid orange";

let uri = document.location;
if (domainInBlacklist(uri)) {
    console.log('failed');
    document.body.style.border = "5px solid red";
} else {
    dataForIndex();
    document.body.style.border = "5px solid green";
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
        console.log(response);
        return response.json();
    }).then((data) => {
        if ((data['flagResurf']) && (data['uriResurf'])) {
            console.log('postAjax MySearch-AddOn: resurf to url:' + data['uriResurf']);
            document.location.href = data['uriResurf'];
        }
        console.log('postAjax MySearch-AddOn: response-Urls perhaps for next requests');
        console.log(data);
        //return data.json();
    }).catch(function (error) {
        console.log('postAjax MySearch-AddOn with following object of error');
        console.log(error);
    });

}

function getLinkList() {
    let list = Array.from(document.links),
        result = {
            'own': [],
            'menu': [],
            'foreign': [],
        }
        baseHref = document.href;
    list.forEach(elem => {
        let protocol = elem.protocol.toLowerCase();
        if (['http:', 'https:', 'file:'].includes(protocol)) {
            let hash = elem.hash ? '#' + elem.hash : '',
                search = elem.search ? elem.search : '',
                href = elem.protocol + "//" + elem.host + elem.pathname + search + hash;
            if ((href !== elem.baseURI)
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

                if (elem.href === baseHref) {
                    if (flagMenu) {
                        result.menu[result.menu.length] = {
                            name: name,
                            uri: href,
                            path: elem.pathname
                        };
                    } else {
                        result.own[result.own.length] = {
                            name: name,
                            uri: href,
                            path: elem.pathname
                        };

                    }
                } else {
                    result.foreign[result.foreign.length] = {
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
    return 'general';

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
    flag = flag || (['www.bing.com','www.bing.de','www.google.com','www.google.de',].includes(testUri));
    return flag;
}

function dataForIndex() {
    // parameter of content listed in file \web\typo3conf\ext\mysearch\Classes\Config\SelfConst.php for check-proposes
    let uri = document.location,
        content = {
            index: uri['protocol'] + "//" + uri['hostname'] + (!uri['port'] ? ':' + uri['port'] : '') + uri['pathname'] + uri['search'] + uri['hash'],
            type: getIndexListFromStorage(),
            body: document.body.innerHTML,
            bodyText: document.body.innerText,
            links: getLinkList(),
            headlines: getHeadlineList(),
        };
    postAjax(ELASTIC_LOCAL_URL, content);

}

