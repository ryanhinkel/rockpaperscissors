{ div, span } = require './elements'
colors = require './colors'

paired = (key, unpair) ->
  colorName = colors.names(key)
  css = { color: colors.dynamic(key) }
  div {
      style: css,
      className: 'pair',
      onClick: unpair,
      onTouchStart: unpair
    },
    'Paired with ' + colorName

unpaired = (key) ->
  css = { color: colors.dynamic(key) }
  div { style: css, className: 'pair' }, 'Unpaired'

module.exports = (props, dispatch) ->
  unpair = () ->
    dispatch 'disconnect', 'Unpair Request'

  className = if props.playing then 'me playing' else 'me'
  message = if props.me then 'Connected ' + props.me else 'Click to connect'
  pair = if props.pair then paired(props.pair, unpair) else unpaired(null)

  div { className },
    pair
    span { className: 'message' }, message
