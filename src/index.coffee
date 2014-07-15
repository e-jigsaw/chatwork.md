applyMD = ->
  for messageArea in document.querySelectorAll('.chatTimeLineMessageArea')
    pre = messageArea.querySelector 'pre'
    info = messageArea.querySelectorAll '.chatInfo'
    if info.length is 0
      tos = messageArea.querySelectorAll '.chatTimeLineTo'
      res = messageArea.querySelectorAll '.chatTimeLineReply'
      imgs = messageArea.querySelectorAll 'img'
      div = document.createElement 'div'
      for to in tos
        div.innerHTML += to.outerHTML
      for re in res
        div.innerHTML += re.outerHTML
      for img in imgs
        div.innerHTML += img.outerHTML
      url = pre.textContent.match(/([^\(|\[]|^)(https?)(:\/\/[-_.!~*¥'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)([^\)|\]]|$)/)
      if url isnt null
        re = new RegExp url[0]
        pre.textContent = pre.textContent.replace re, "[#{url[0]}](#{url[0]})"
      div.innerHTML += markdown.toHTML pre.textContent
      div.classList.add 'markdown-body'
      messageArea.replaceChild div, messageArea.querySelector('pre')

window.onload = ->
  target = document.querySelector '#_timeLine'
  observer = new MutationObserver (mutations)-> applyMD()
  observer.observe target,
    childList: true
  textarea = document.querySelector('#_chatText')
  textareaObserver = new MutationObserver (mutations)-> target.scrollTop = 9999999999 if textarea.value.length is 0
  textareaObserver.observe textarea,
    attributes: true
  applyMD()
