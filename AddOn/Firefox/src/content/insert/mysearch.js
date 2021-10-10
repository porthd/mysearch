console.log('first hallo Welt');

document.body.style.border = "5px solid blue";

const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

function postAjax(url, data) {

    return fetch(url, {
        method: "POST",
        body: JSON.stringify(data)
    }).then(response => {
        // let result = response.json(),
        //     urls = result.urls;
        console.log('postAjax MySearch-AddOn: response-Urls perhaps for next requests');
    }).catch(function (error) {
        console.log('postAjax MySearch-AddOn with following object of error');
        console.log(error);
    });

}

function getLinkList() {
    let list = Array.from(document.links),
        result = [];
    list.forEach((elem) => {
        if (['http', 'https'].includes(elem.protocol)) {
            result[result.length] = {
                name: elem.innerText,
                uri: elem.protocol + "//" + elem.hostname + (!elem.port ? ':' + elem.port : '') + elem.pathname + elem.search + elem.hash,
                path: elem.pathname
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

function domainNotInBlacklist(testUri) {
    let flag = true;
    console.log(testUri);
    flag = flag && (testUri !== 'mysearch.ddev.site');
    flag = flag && false;
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
    // document.location.href="https://mysearch.ddev.site/";
    if (domainNotInBlacklist(uri['hostname'])) {
        postAjax(ELASTIC_LOCAL_URL, content);
    }
    postAjax(ELASTIC_LOCAL_URL, content);

}

console.log('last hallo Welt');
document.addEventListener('DOMContentLoaded', (event) => {
    console.log('hallo Welt');
    dataForIndex();
});
dataForIndex();
console.log('ever last hallo Welt');

// dataForIndex();
