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
    associate state, 'me', null

  welcomed: (state, id) ->
    associate state, 'me', id

  shoot: (state, payload) ->
    state.connection.send payload
    assign {}, state,
      yours: payload
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

  clean: (state, payload) ->
    assign {}, state,
      yours: null
      theirs: null
      shooting: false
      playing: false

# Dispatch creator
module.exports = (store, callback) ->
  dispatch = (action, payload) ->
    console.log("-----------")
    console.log(action + " dispatched")
    console.log(payload)
    action = actions[action]
    result = action.call null, store.state, payload
    callback result, dispatch
