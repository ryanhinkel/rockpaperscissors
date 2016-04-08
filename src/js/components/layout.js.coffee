{ div, a, span } = require './elements'
partial = require('lodash/partial')

playButton = (fn, data, label, played) ->
  className = if data is played then 'active' else ''
  a { className: className, onClick: fn(data) }, label

app = (props, dispatch) ->
  shoot = (play) ->
    () ->
      dispatch 'shoot', play

  className = if props.playing then 'playing' else ''

  if not props.me
    div {}, 'Connecting...'
  else
    div { className: 'app-root' },
      div { className: className }, 'Connected ', props.me,

      div { className: 'player-buttons' }
        playButton(shoot, 'rock', "Rock", props.played)
        playButton(shoot, 'paper', "Paper", props.played)
        playButton(shoot, 'scissors', "Scissors", props.played)

      div { className: 'responses' },
        props.responses.map (response, key) =>
          div { key: key },
            span {}, key, ": "
            span {}, JSON.stringify(response)

module.exports = app