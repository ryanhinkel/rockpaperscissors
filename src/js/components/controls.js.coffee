{ div, a, span } = require './elements'
colors = require './colors'

controlTimeout = 1000

playButton = (fn, key, label, played, color) ->
  color = if key is played then color else colors.highlight
  a { onClick: fn(key) },
    div {
      style:
        border: '2px solid ' + color
        margin: '.5em'
        padding: '.5em'
        borderRadius: '.5em'
      },
      span { className: 'label', style: { color: color} }, label


controls = (props, dispatch) ->
  { yours, pair, shooting, playing } = props
  color = colors.dynamic(pair)

  clear = () ->
    dispatch 'clear', null

  shoot = (play) ->
    () ->
      if not playing and not shooting
        setTimeout clear, controlTimeout
        dispatch 'shoot', play

  div { className: 'player-controls' },
    playButton(shoot, 'rock', "Rock", yours, color)
    playButton(shoot, 'paper', "Paper", yours, color)
    playButton(shoot, 'scissors', "Scissors", yours, color)

module.exports = controls
