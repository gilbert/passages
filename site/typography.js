(function(){

  var spanWrap = document.createElement('span')
  spanWrap.setAttribute('class', 'dialog')

  findAndReplaceDOMText(document.querySelector('.box'), {
    find: /«[^»]+»/g,
    wrap: spanWrap
  })

  findAndReplaceDOMText(document.querySelector('.box'), {
    find: /\(([0-9]+)\)/g,
    replace: function (portion, match) {
      var idWrap = document.createElement('a')

      idWrap.setAttribute('class', 'section')
      idWrap.setAttribute('id', 's-' + match[1])
      idWrap.setAttribute('href', '#s-' + match[1])
      idWrap.innerText = match[0]

      return idWrap
    }
  })
})()
