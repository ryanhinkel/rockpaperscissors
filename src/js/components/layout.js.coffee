{ div, a, span } = require './elements'
RockPaperScissor = require './rock_paper_scissors'

partial = (fn, arg) ->
  fn.bind(null, arg)

module.exports = app = (props) ->
  if not props.me
    div {}, 'Connecting...'
  else
    div { className: 'app-root' },
      div {}, 'Connected ', props.me,
      div { className: 'player-buttons' }
        a { onClick: partial(shoot, 'rock') }, 'Rock '
        a { onClick: partial(shoot, 'paper') }, 'Paper '
        a { onClick: partial(shoot, 'scissors') }, 'Scissors '
      div { className: 'responses' },
        props.responses.map (response, key) =>
          div { key: key },
            span {}, key, ": "
            span {}, JSON.stringify(response)

# RockPaperScissor({ background: '#000', foreground: '#fff' })
