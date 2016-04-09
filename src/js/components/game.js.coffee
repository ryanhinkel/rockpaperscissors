{ div, span } = require './elements'
colors = require './colors'

status = require './status'
controls = require './controls'
rockpaperscissors = require './rock_paper_scissors'

game = (props, dispatch) ->
  foregroundColor = colors.dynamic(props.pair)

  div { className: 'app-root game', style: { backgroundColor: colors.background } },

    status(props, dispatch)
    controls(props, dispatch)

    if props.you is 'win'
      div { className: 'you-win banner', style: { backgroundColor: foregroundColor } }, "YOU WIN!"

    if props.you is 'lose'
      div { className: 'you-lose blink', style: { backgroundColor: colors.highlight } }, ""

    div { className: 'display' },
      rockpaperscissors(props.yours, props.theirs, props.you, foregroundColor)


module.exports = game
