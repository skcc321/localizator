'use strict';

class LocaleLinks {
  constructor() {
    this.editLinkClass = "edit-locale-link";
    this.editLinkWrapperClass = "edit-locale-link-wrapper";
    this.editLinkRegexp = /(<i class='edit-locale-link'.*<\/i>)/g;
  }

  init() {
    this.processInputElements();
    this.processImgElements();
    this.getLinkElements();
    this.bindActions();
  }

  getLinkElements() {
    this.linkElements = document.getElementsByClassName(this.editLinkClass);
  }

  processImgElements() {
    var imgs = document.getElementsByTagName('img');

    for (var img of imgs) {
      var alt = img.alt.trim().replace(/\n/g, '');

      var match = this.editLinkRegexp.exec(alt);

      // placeholder match -----------------------------------
      if (match !== null) {
        var first_match = match[0];

        // replace placeholder
        img.alt = alt.replace(first_match, '');

        // create new container
        var newLinkContainer = document.createElement('span');
        newLinkContainer.innerHTML = first_match;
        newLinkContainer.style.height = img.offsetHeight + 'px';
        newLinkContainer.style.width = img.offsetHeight + 'px';
        newLinkContainer.style.display = 'inline-block';
        newLinkContainer.style.position = 'absolute';
        newLinkContainer.style.top = img.offsetTop + 'px';
        newLinkContainer.style.lineHeight = img.offsetHeight + 'px';
        newLinkContainer.style.textAlign = 'left';

        img.parentNode.insertBefore(newLinkContainer, img.nextSibling);
      }
    }
  }

  processInputElements() {
    var inputs = document.getElementsByTagName('input');

    for (var input of inputs) {
      var placeholder = input.placeholder.trim().replace(/\n/g, '');;
      var match = this.editLinkRegexp.exec(placeholder);

      // placeholder match -----------------------------------
      if (match !== null) {
        var first_match = match[0];

        // replace placeholder
        input.placeholder = placeholder.replace(first_match, '');

        // create new container
        var newLinkContainer = document.createElement('span');
        newLinkContainer.innerHTML = first_match;
        newLinkContainer.style.height = input.offsetHeight + 'px';
        newLinkContainer.style.width = input.offsetHeight + 'px';
        newLinkContainer.style.display = 'inline-block';
        newLinkContainer.style.position = 'absolute';
        newLinkContainer.style.top = input.offsetTop + 'px';
        newLinkContainer.style.lineHeight = input.offsetHeight + 'px';
        newLinkContainer.style.textAlign = 'left';

        input.parentNode.insertBefore(newLinkContainer, input.nextSibling);
      }

      // Value match -----------------------------------------
      var value = input.value.trim().replace(/\n/g, '');
      var match = this.editLinkRegexp.exec(value);

      if (match !== null) {
        var first_match = match[0];

        // replace placeholder
        input.value = value.replace(first_match, '');

        // create new container
        var newLinkContainer = document.createElement('span');
        newLinkContainer.innerHTML = first_match;
        newLinkContainer.style.height = input.offsetHeight + 'px';
        newLinkContainer.style.width = input.offsetHeight + 'px';
        newLinkContainer.style.display = 'inline-block';
        newLinkContainer.style.position = 'absolute';
        // newLinkContainer.style.top = input.offsetTop + 'px';
        newLinkContainer.style.lineHeight = input.offsetHeight + 'px';
        newLinkContainer.style.textAlign = 'left';

        input.parentNode.insertBefore(newLinkContainer, input.nextSibling);
      }
    }
  }

  bindActions() {
    for (var link of this.linkElements) {
      link.addEventListener('click', this.openLink, false);
      link.parentNode.classList.add(this.editLinkWrapperClass);
    }
  }

  openLink() {
    var link = this.getAttribute("data-href");
    window.open(link, '_blank').focus();
  }
}

document.addEventListener("ready", function(){
  var localeLinks = new LocaleLinks();
  localeLinks.init();
});

document.addEventListener("turbolinks:load", function(){
  var localeLinks = new LocaleLinks();
  localeLinks.init();
});
