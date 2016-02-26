adressPOST = window.location.pathname
id = adressPOST.split('/')
window.Poll = ->
  setTimeout ->
    $.get(id[id.length-1] + '/comments')
  , 2000

jQuery ->
  Poll() if $('#chat-panel').size() > 0