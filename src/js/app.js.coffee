{ render } = require 'react-dom'
layout = require './components/layout'

store =
  connection: null
  data:
    me: null
    responses: []

socketConnect = () ->
  store.connection = c = new WebSocket 'ws://localhost:3000/ready'
  c.onopen = () ->
    c.send 'hello'
  c.onmessage= (event) ->
    data = JSON.parse(event.data)
    if data.welcome
      store.data.me = data.welcome
    else
      store.data.responses.push(data)
    refresh(store.data)

window.shoot = (play) ->
  store.connection.send(play)

refresh = (props) ->
  ui = layout(props)
  element = document.getElementById 'app'
  render ui, element

socketConnect()
refresh(store.data)

