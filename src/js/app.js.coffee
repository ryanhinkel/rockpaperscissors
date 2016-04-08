{ render } = require 'react-dom'
layout = require './components/layout'
connect = require './actions'
store = require './store'

cleanTimeout = 1000;

websocket = (dispatch) ->
  clean = () ->
    dispatch 'clean', null

  c = new WebSocket 'ws://play.promptworks.com:8100/ready'
  c.onopen = () ->
    dispatch 'connected', c

  c.onmessage = (event) ->
    data = JSON.parse(event.data)
    if data.welcome
      dispatch 'welcomed', data.welcome
    else if data.game
      setTimeout clean, cleanTimeout
      dispatch 'check', data

  c.onclose = (event) ->
    dispatch 'disconnected', null

update = (newState, dispatch) ->
  store.state = newState
  refresh store.state

refresh = (props) ->
  ui = layout(props, dispatch, websocket)
  element = document.getElementById 'app'
  render ui, element

# create dispatch function and pass store and refresh
dispatch = connect(store, update)

# create socket connection and pass dispatch so
# actions can be triggered by the connection
# websocket(dispatch)

# initial refresh
refresh(store.state, dispatch)
