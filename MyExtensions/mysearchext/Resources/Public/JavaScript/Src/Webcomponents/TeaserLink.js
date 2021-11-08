class TeaserLink extends HTMLDivElement {
  constructor() {
    // Always call super first in constructor
    super();
    const myLink = this.innerText;
    const uriLink = this.checkUriLink(myLink);
    if ((myLink) &&
      (myLink === this.innerHTML) &&
      (uriLink)
    ) {
      let lastPartLink = this.getLastPartLink(myLink);
       this.innerHTML = '<a href="'+uriLink+'" >'+lastPartLink+'</a>';
    }

  }
  checkUriLink(urlTest){
    return urlTest;
  }
  getLastPartLink(urlTest){
    let parts = urlTest.split('?'),
        lastTast = parts[0].split('/');
    if (lastTast.length >1){
      let len = lastTast.length-1;

      if (lastTast[len]) {
        return lastTast[len];
      } else {
        return lastTast[len-1];
      }

    } else {
      return parts[0];
    }
  }
}

// Define the new element
customElements.define('teaser-link', TeaserLink, {extends: 'div'});
