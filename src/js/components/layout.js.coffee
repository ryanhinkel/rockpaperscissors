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
      div { className: 'me ' + className }, 'Connected ', props.me,

      div { className: 'player-buttons' }
        playButton(shoot, 'rock', "Rock", props.yours)
        playButton(shoot, 'paper', "Paper", props.yours)
        playButton(shoot, 'scissors', "Scissors", props.yours)

      div { className: 'responses' },
        props.responses.map (response, key) =>
          div { key: key },
            span {}, key, ": "
            span {}, JSON.stringify(response)

module.exports = app
