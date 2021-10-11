const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

document.body.style.border = "5px solid orange";

    let uri = document.location;
    if (domainNotInBlacklist(uri['hostname'])){

        dataForIndex();
        document.body.style.border = "5px solid green";
    } else {
        document.body.style.border = "5px solid red";

    }
// document.body.style.border = "5px solid blue";

function postAjax(url, data) {

    return fetch(url, {
        method: "POST",
        body: JSON.stringify(data)
    }).then(response => {
        console.log('postAjax MySearch-AddOn: response-Urls perhaps for next requests');
        console.log(response);
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
    flag = flag && (testUri !== 'mysearch.ddev.site');
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

