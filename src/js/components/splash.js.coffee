{ a, div, span, img } = require './elements'
colors = require './colors'
logo = require './../logo'
status = require './status'

splash = (props, dispatch, websocket) ->
  connect = () ->
    websocket(dispatch)

  div {
      className: 'app-root splash',
      style: { backgroundColor: colors.background }
      onClick: connect
      onTouchStart: connect
    },

    status(props, dispatch)
    div { className: 'entry' },
      img { src: logo, className: 'logo' }
      div {}, 'Rock Paper Scissors'
      a {}, 'Play!'

module.exports = splash
