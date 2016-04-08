{ div, a, span } = require './elements'
colors = require './colors'

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


controls = (yours, color, dispatch) ->
  shoot = (play) ->
    () ->
      dispatch 'shoot', play

  div { className: 'player-controls' },
    playButton(shoot, 'rock', "Rock", yours, color)
    playButton(shoot, 'paper', "Paper", yours, color)
    playButton(shoot, 'scissors', "Scissors", yours, color)

module.exports = controls
