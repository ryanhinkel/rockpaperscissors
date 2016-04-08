{ div, a } = require './elements'

playButton = (fn, data, label, played) ->
  className = if data is played then 'active' else ''
  a { className: className, onClick: fn(data) }, label

controls = (yours, dispatch) ->
  shoot = (play) ->
    () ->
      dispatch 'shoot', play

  div { className: 'player-buttons' },
    playButton(shoot, 'rock', "Rock", yours)
    playButton(shoot, 'paper', "Paper", yours)
    playButton(shoot, 'scissors', "Scissors", yours)

module.exports = controls
