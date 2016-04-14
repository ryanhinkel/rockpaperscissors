{ a, div, span, img } = require './elements'
colors = require './colors'
status = require './status'
graphic = require './splash_graphic'

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
      graphic()

module.exports = splash
