assign = require 'lodash/assign'

objWith = (key, val) ->
  obj = {}
  obj[key] = val
  obj

associate = (object, key, val) ->
  assign {}, object, objWith(key, val)

actions =
  connected: (state, connection) ->
    connection.send 'hello'
    assign {}, state,
     connection: connection
     closeCode: null

  disconnect: (state, payload) ->
    state.connection.close '1000', payload
    assign {}, state,
      me: null
      pair: null
      yours: null
      theirs: null

  disconnected: (state, payload) ->
    assign {}, state,
      me: null
      pair: null
      yours: null
      theirs: null
      closeCode: payload.code

  welcomed: (state, id) ->
    associate state, 'me', id

  shoot: (state, selection) ->
    state.connection.send selection
    assign {}, state,
      yours: selection
      theirs: null
      shooting: true

  clear: (state) ->
    if state.playing
      state
    else
      assign {}, state,
        yours: null
        shooting: false

  check: (state, payload) ->
    assign {}, state,
      yours: payload.yours
      theirs: payload.theirs
      shooting: false
      playing: true
      pair: payload.pair
      you: payload.you

  blink: (state, payload) ->
    assign {}, state,
      you: payload

  clean: (state) ->
    assign {}, state,
      shooting: false
      playing: false
      you: null

# Dispatch creator
module.exports = (store, callback) ->
  dispatch = (action, payload) ->
    console.log(action + " dispatched")
    action = actions[action]
    result = action.call null, store.state, payload
    callback result, dispatch
