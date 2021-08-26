document.body.style.border = "5px solid red";

const ELASTIC_LOCAL_URL = 'https://mysearch.ddev.site/search/';

document.addEventListener('DOMContentLoaded', (event) => {
    console.log("Send Dat to ".windows.location.href); //output messages to the console
});
    function postAjax(url, data, successFunc) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (typeof successFunc === 'function') {
                    successFunc(xhr.responseText)
                } else {

                    var json = JSON.parse(xhr.responseText);
                    console.log(json.message);
                }
            }
        };
        var jsonData = JSON.stringify(data);
        xhr.send(jsonData);

        return xhr;
    }

    function getLinkList() {
        let list = document.links,
            result = [];
/*
        list.forEach((elem) => {
            if (!elem.name) {
                result[result.length] = {
                    name: elem.innerText,
                    uri: elem.protocol + "//" + elem.hostname + (!elem.port ? ':' + elem.port : '') + elem.pathname + elem.search + elem.hash,
                    path: elem.pathname
                }
            }
        });
*/
        return result;
    }

    function getHeadlineList() {
        let list = document.body.querySelectorAll('h1,h2,h3,h4'),
            result = [];
        // list.forEach((elem) => {
        //     let dummy = elem.innerText.trim();
        //     if ($dummy !== '') {
        //         result[result.length] = elem.innerText
        //     }
        // });
        return result;
    }

    let content = {
        body: document.body,
        links: getLinkList(),
        headlines: getHeadlineList(),
    }

    postAjax(ELASTIC_LOCAL_URL, content);
    console.log("Send single Dat to ".windows.location.href); //output messages to the console

