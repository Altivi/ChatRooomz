window.Poll = ->
  setTimeout ->
    $.get('/rooms/1/comments')
  , 1000

jQuery ->
  Poll() if $('#chat-panel').size() > 0