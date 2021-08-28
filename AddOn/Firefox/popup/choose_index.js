

/*
Listen for clicks in the popup.

If the click is on one of the beasts:
  Inject the "beastify.js" content script in the active tab.

  Then get the active tab and send "beastify.js" a message
  containing the URL to the chosen beast's image.

If it's on a button which contains class "clear":
  Reload the page.
  Close the popup. This is needed, as the content script malfunctions after page reloads.
*/
var internKey = 'flags';
    flags= {
        arts: false,
        docs: true,
        private: false,
        science: true,
    };
browser.storage.local.set({internKey:flags}, ()=> {
    console.log('flags is setted');
});
let dummy = browser.storage.local.get(internKey, (result) => {
    console.log(result);
    console.log('flags: ' + result.flags.docs);
    console.log(result[internKey].docs);
    return result[internKey].docs;
});
console.log('dummy');
console.log(dummy);
//     browser.storage.local.set({
//         arts: false,
//         docs: true,
//         private: false,
//         science: true,
//     });
// console.log(browser.storage.local.get());
// console.log(browser.storage.local.get("flags"));

['private', 'arts', 'docs', 'science'].forEach((type) => {
    let node = document.querySelector('.' + type),
        res = browser.storage.local.get([type], (res) =>{
            // console.log('flag '+type+': ' + res);
            // console.log(res);
            // console.log(res[type]);
            return res[type];
        });
        // console.log('hAlo res');
        // console.log(res);
    if (res) {
        if (!node.classList.contains('active')) {
            node.classList.add('active');
        }
    } else {
        if (node.classList.contains('active')) {
            node.classList.remove('active');
        }
    }
});

var listNodes = document.querySelectorAll('.btn');
for (let node of listNodes) {

    node.addEventListener("click", function () {
        let allRes= browser.storage.local.get(),
            res = allRes[node.dataset.type];
        // console.log('allRes');
        // console.log(allRes);
        if (typeof res !== 'undefined') {
            allRes[node.dataset.type] = !res;
            browser.storage.local.set(allRes);
            if (!res) {
                if (!node.classList.contains('active')) {
                    node.classList.add('active');
                }
            } else {
                if (node.classList.contains('active')) {
                    node.classList.remove('active');
                }
            }
        }
    }, false);

}
