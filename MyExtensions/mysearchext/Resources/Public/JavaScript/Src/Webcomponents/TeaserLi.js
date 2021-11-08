class TeaserLi extends HTMLLIElement {
  constructor() {
    // Always call super first in constructor
    super();

    const strongWord = ((this.getAttribute('strongword') ) ?
        this.getAttribute('strongword') :
        ''
    );
    if (strongWord) {
      const myText = this.innerHTML,
      search = new RegExp(strongWord,'ig');
      this.innerHTML = myText.replace(search,'<strong>$&</strong>');
    }
  }
}

// Define the new element
customElements.define('teaser-li', TeaserLi, {extends: 'li'});
