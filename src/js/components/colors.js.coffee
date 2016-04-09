cycleColors = [
 '#ffc301',
 '#ff3348',
 '#00b58c',
 '#009eff',
 '#9852ff'
]

cycleColorNames = [
  'Yellow',
  'Red',
  'Green',
  'Blue',
  'Purple'
]

module.exports =
  highlight: '#ffffff'
  foreground: '#e8c425'
  background: '#111111'
  dynamic: (key) ->
    if not key
      '#666'
    else
      cycleColors[key % cycleColors.length]
  names: (key) ->
    cycleColorNames[key % cycleColors.length]

