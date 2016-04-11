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

unpaired = (key, closeCode) ->
  css = { color: colors.dynamic(key) }
  div { style: css, className: 'pair' }, 'Unpaired ' + closeCode

module.exports = (props, dispatch) ->
  unpair = () ->
    dispatch 'disconnect', 'Unpair Request'

  closeCode = if props.closeCode then 'with code ' + props.closeCode else ''

  className = if props.playing then 'me playing' else 'me'
  message = if props.me then 'Connected ' + props.me else 'Click to connect'
  pair = if props.pair then paired(props.pair, unpair) else unpaired(props.pair, closeCode)

  div { className },
    pair
    span { className: 'message' }, message
