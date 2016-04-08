{ render } = require 'react-dom'
layout = require './components/layout'
connect = require './actions'
store = require './store'

websocket = (dispatch) ->
  c = new WebSocket 'ws://54.208.58.61:8100/ready'
  c.onopen = () ->
    dispatch 'connected', c

  c.onmessage = (event) ->
    data = JSON.parse(event.data)
    if data.welcome
      dispatch 'welcomed', data.welcome
    else
      dispatch 'check', data
      # store.data.responses.push(data)

  c.onclose = (event) ->
    console.log('closed!');

update = (newState, dispatch) ->
  store.state = newState
  refresh store.state

refresh = (props) ->
  ui = layout(props, dispatch)
  element = document.getElementById 'app'
  render ui, element

# create dispatch function and pass store and refresh
dispatch = connect(store, update)

# create socket connection and pass dispatch so
# actions can be triggered by the connection
websocket(dispatch)

# initial refresh
refresh(store.state, dispatch)
