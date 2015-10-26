(function(){

  var wrapper = document.createElement('span')
  wrapper.setAttribute('class', 'dialog')

  findAndReplaceDOMText(document.querySelector('.box'), {
    find: /«[^»]+»/g,
    wrap: wrapper
  })
})()
