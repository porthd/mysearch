document.body.style.border = "5px solid red";

const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

document.addEventListener('DOMContentLoaded', (event) => {
    // console.log("Send Dat to ".windows.location.href); //output messages to the console
});

function postAjax(url, data) {
    return fetch(url, {
        method: "POST",
        body: JSON.stringify(data)
    });
}

function getLinkList() {
    let list = Array.from(document.links),
        result = [];
    list.forEach( (elem) => {
        // console.log('elem set'+elem);
        if (['http','https'].includes(elem.protocol)) {
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
    let list = '';
    ['science', 'private', 'docs', 'arts'].forEach((elem) => {
        browser.storage.local.get(elem)
            .then(
                (item) => {
                    list = list + item + ','
                },
                (error) => {
                    // console.log('error: ' + elem);
                    // console.log(error);
                });
    });
    return list;
}

function getHeadlineList() {
    let list = document.body.querySelectorAll('h1,h2,h3,h4'),
        result = [];
    Array.from(list).forEach(
        (elem) => {
            let dummy = elem.innerText.trim();
            if (dummy !== '') {
                result[result.length] = dummy;
            }
        });
    return result;
}

let uri = document.location,
    content = {
        index: uri['protocol'] + "//" + uri['hostname'] + (!uri['port'] ? ':' + uri['port'] : '') + uri['pathname'] + uri['search'] + uri['hash'],
        type: getIndexListFromStorage(),
        body: document.body.innerHTML,
        bodyText: document.body.innerText,
        links: getLinkList(),
        headlines: getHeadlineList(),
    };
// console.log('aktive stuff start');
// console.log(content);
// console.log(ELASTIC_LOCAL_URL);
//POST example
postAjax(ELASTIC_LOCAL_URL,content);
// console.log("Send single Dat to "+window.location.href); //output messages to the console

