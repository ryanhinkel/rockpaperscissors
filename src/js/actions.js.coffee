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
    associate state, 'connection', connection

  disconnected: (state, payload) ->
    assign {}, state,
      me: null
      pair: null
      yours: null
      theirs: null

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

  clean: (state) ->
    assign {}, state,
      shooting: false
      playing: false
      you: null

# Dispatch creator
module.exports = (store, callback) ->
  dispatch = (action, payload) ->
    console.log("-----------")
    console.log(action + " dispatched")
    console.log(payload)
    action = actions[action]
    result = action.call null, store.state, payload
    callback result, dispatch
