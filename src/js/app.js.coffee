{ render } = require 'react-dom'
{ div, a, span } = require './elements'
RockPaperScissor = require './rock_paper_scissor'

partial = (fn, arg) ->
  fn.bind(null, arg)

store =
  data:
    connection: null
    me: null
    responses: []

socketConnect = () ->
  store.data.connection = c = new WebSocket 'ws://localhost:3000/ready'
  c.onopen = () ->
    c.send 'hello'
  c.onmessage= (event) ->
    data = JSON.parse(event.data)
    if data.welcome
      store.data.me = data.welcome
    else
      store.data.responses.push(data)
    refresh(store.data)

shoot = (play) ->
  store.data.connection.send(play)


app = (props) ->
  if not props.connection
    div {}, 'Connecting...'
  else
    div { className: 'app-root' },
      div {}, 'Connected ', props.me,
      div { className: 'player-buttons' }
        a { onClick: partial(shoot, 'rock') }, 'Rock '
        a { onClick: partial(shoot, 'paper') }, 'Paper '
        a { onClick: partial(shoot, 'scissors') }, 'Scissors '
      div { className: 'responses' },
        props.responses.map (response, key) =>
          div { key: key },
            span {}, key, ": "
            span {}, JSON.stringify(response)



refresh = (props) ->
  ui = app(props)
  element = document.getElementById 'app'
  render ui, element

socketConnect()
refresh(store.data)

# RockPaperScissor({ background: '#000', foreground: '#fff' })
