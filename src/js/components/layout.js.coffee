{ div, span } = require './elements'
partial = require 'lodash/partial'

controls = require './controls'

app = (props, dispatch) ->
  className = if props.playing then 'playing' else ''

  if not props.me
    div { className: 'me connecting'}, 'Connecting...'
  else
    div { className: 'app-root' },
      div { className: 'me ' + className }, 'Connected ', props.me

      controls(props.yours, dispatch)

      div { className: 'responses' },
        props.responses.map (response, key) =>
          div { key: key },
            span {}, key, ": "
            span {}, JSON.stringify(response)

module.exports = app
