{ a, div, span, img } = require './elements'
colors = require './colors'
logo = require './../logo'

splash = (props, dispatch, websocket) ->
  connect = () ->
    websocket(dispatch)

  div {
    className: 'app-root',
    style: { backgroundColor: colors.background }
    onClick: connect
    onTouchStart: connect
    },
    div { className: 'me connecting'}, 'Waiting for connection'
    div { className: 'splash' },
      img { src: logo, className: 'logo' }
      div {}, 'Rock Paper Scissors'
      a {}, 'Play!'


module.exports = splash
