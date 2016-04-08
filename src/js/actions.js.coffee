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
      playing: true

  check: (state, payload) ->
    assign {}, state,
      theirs: payload.theirs
      playing: false

# Dispatch creator
module.exports = (store, callback) ->
  dispatch = (action, payload) ->
    console.log(action + " dispatched")
    action = actions[action]
    result = action.call null, store.state, payload
    callback result, dispatch
