{ render } = require 'react-dom'
{ div } = require './elements'
RockPaperScissor = require './rock_paper_scissor'

refresh = (props) ->
  ui = RockPaperScissor({ background: '#aaa', foreground: '#fff' })
  element = document.getElementById 'app'
  render ui, element

refresh()
