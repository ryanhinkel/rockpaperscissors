{ div, span } = require './elements'

game = require './game'
splash = require './splash'

app = (props, dispatch) ->
  if not props.me
    splash props, dispatch
  else
    game props, dispatch

module.exports = app
