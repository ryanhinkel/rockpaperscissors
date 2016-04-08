{ div, span } = require './elements'
partial = require 'lodash/partial'
colors = require './colors'

controls = require './controls'
rockpaperscissors = require './rock_paper_scissors'

app = (props, dispatch) ->
  className = if props.playing then 'playing' else ''
  foregroundColor = colors.dynamic(props.pair)

  if not props.me
    div { className: 'me connecting'}, 'Connecting...'
  else
    div { className: 'app-root', style: { backgroundColor: colors.background } },
      div { className: 'me ' + className }, 'Connected ', props.me

      controls(props.yours, foregroundColor, dispatch)

      div { className: 'display' },
        rockpaperscissors(props.yours, props.theirs, foregroundColor)

module.exports = app
