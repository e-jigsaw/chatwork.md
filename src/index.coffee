applyMD = ->
  for messageArea in document.querySelectorAll('.chatTimeLineMessageArea')
    pre = messageArea.querySelector 'pre'
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
    div.innerHTML += markdown.toHTML pre.textContent
    messageArea.replaceChild div, messageArea.querySelector('pre')

window.onload = ->
  target = document.querySelector '#_timeLine'
  observer = new MutationObserver (mutations)-> applyMD()
  observer.observe target,
    childList: true
  applyMD()
