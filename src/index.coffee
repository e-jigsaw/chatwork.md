applyMD = ->
  for messageArea in document.querySelectorAll('.chatTimeLineMessageArea')
    pre = messageArea.querySelector 'pre'
    info = messageArea.querySelectorAll '.chatInfo'
    if info.length is 0
      quotes = messageArea.querySelectorAll '.chatQuote'
      div = document.createElement 'div'
      for quote in quotes
        quote.remove()
      tos = messageArea.querySelectorAll '.chatTimeLineTo'
      res = messageArea.querySelectorAll '.chatTimeLineReply'
      imgs = messageArea.querySelectorAll 'img'
      for to in tos
        div.innerHTML += to.outerHTML
      for re in res
        div.innerHTML += re.outerHTML
      for img in imgs
        div.innerHTML += img.outerHTML
      for quote in quotes
        div.innerHTML += quote.outerHTML
      url = pre.textContent.match(/([^\(|\[]|^)(https?)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)([^\)|\]]|$)/)
      if url isnt null
        pre.textContent = pre.textContent.replace url[0], "[#{url[0]}](#{url[0]})"
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
