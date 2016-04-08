{ div, span } = require './elements'

game = require './game'
splash = require './splash'

app = (props, dispatch, connect) ->
  if not props.me
    splash props, dispatch, connect
  else
    game props, dispatch

module.exports = app
