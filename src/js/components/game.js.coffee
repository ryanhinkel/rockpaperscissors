{ div, span } = require './elements'
colors = require './colors'

controls = require './controls'
rockpaperscissors = require './rock_paper_scissors'

game = (props, dispatch) ->
  className = if props.playing then 'playing' else ''
  foregroundColor = colors.dynamic(props.pair)

  div { className: 'app-root game', style: { backgroundColor: colors.background } },
    div { className: 'me ' + className }, 'Connected ', props.me

    controls(props, dispatch)

    if props.you is 'win'
      div { className: 'you-win banner', style: { backgroundColor: foregroundColor } }, "YOU WIN!"

    if props.you is 'lose'
      div { className: 'you-lose blink', style: { backgroundColor: '#fff' } }, ""

    div { className: 'display' },
      rockpaperscissors(props.yours, props.theirs, props.you, foregroundColor)


module.exports = game
