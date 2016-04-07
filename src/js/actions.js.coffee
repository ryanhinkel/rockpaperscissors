assign = require 'lodash/assign'

objWith = (key, val) ->
  obj = {}
  obj[key] = val
  obj

associate = (object, key, val) ->
  assign {}, object, objWith(key, val)

actions =
  connected: (state, connection) ->
    associate state, 'connection', connection

  welcomed: (state, id) ->
    associate state, 'me', id

  shoot: (state, payload) ->
    state.connection.send payload
    assign {}, state,
      played: payload
      playing: true

# Dispatch creator
module.exports = (store, callback) ->
  dispatch = (action, payload) ->
    console.log(action + " dispatched")
    action = actions[action]
    result = action.call null, store.state, payload
    callback result, dispatch
