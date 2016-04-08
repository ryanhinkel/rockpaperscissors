{ a, div, span, img } = require './elements'
colors = require './colors'

connect = (websocket, dispatch) ->
  () ->
    websocket(dispatch)

splash = (props, dispatch, websocket) ->
  div { className: 'app-root', style: { backgroundColor: colors.background }  },
    div { className: 'me connecting'}, 'Waiting for connection'
    div { className: 'splash' },
      img { src: '/logo.png', className: 'logo' }
      div {}, 'Rock Paper Scissors'
      a { onClick: connect(websocket, dispatch) }, 'Play!'


module.exports = splash
