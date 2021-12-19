class TeaserDiv extends HTMLDivElement {
  constructor() {
    // Always call super first in constructor
    super();

    const myLength = ((this.getAttribute('length') > 0) ?
        this.getAttribute('length') :
        256
    );
    const myEllipse = (this.getAttribute('ellipse') ?
        this.getAttribute('ellipse') :
        '&hellip;'
    );
    const myText = [...this.innerHTML];
    if (myText.length > myLength) {
      let myRes = '';
      for(let i = 0; i < myLength; i++){
          myRes = myRes + myText[i];
      }
      this.innerHTML = myRes + myEllipse;
    }
  }
}

// Define the new element
customElements.define('teaser-div', TeaserDiv, {extends: 'div'});
