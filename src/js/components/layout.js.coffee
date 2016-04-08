{ div, span } = require './elements'
partial = require 'lodash/partial'

controls = require './controls'
rockpaperscissors = require './rock_paper_scissors'

app = (props, dispatch) ->
  className = if props.playing then 'playing' else ''

  if not props.me
    div { className: 'me connecting'}, 'Connecting...'
  else
    div { className: 'app-root' },
      div { className: 'me ' + className }, 'Connected ', props.me

      controls(props.yours, dispatch)

      rockpaperscissors(props.yours, props.theirs)

module.exports = app
