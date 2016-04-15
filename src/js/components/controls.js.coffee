{ div, a, span } = require './elements'
colors = require './colors'

controlTimeout = 1000

playButton = (fn, key, label, played, color, inProgress) ->
  color = if key is played and inProgress then color else colors.highlight
  style =
    border: '2px solid ' + color
    padding: '.5em'
    borderRadius: '.5em'

  a { onClick: fn(key), onTouchStart: fn(key) },
    div { className: 'button', style },
      span { className: 'label', style: { color: color} }, label


controls = (props, dispatch) ->
  { yours, pair, shooting, playing } = props
  color = colors.dynamic(pair)
  inProgress = playing or shooting

  clear = () ->
    dispatch 'clear', null

  shoot = (play) ->
    (e) ->
      e.preventDefault()
      if not inProgress
        setTimeout clear, controlTimeout
        dispatch 'shoot', play

  div { className: 'player-controls' },
    playButton(shoot, 'rock', "Rock", yours, color, inProgress)
    playButton(shoot, 'paper', "Paper", yours, color, inProgress)
    playButton(shoot, 'scissors', "Scissors", yours, color, inProgress)

module.exports = controls
