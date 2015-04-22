loadScript = (src) ->
  script = document.createElement('script')
  script.src = src
  document.body.appendChild script
  script

loadScript chrome.extension.getURL script for script in [
  'vendor/jquery.js'
  'vendor/allAttributes.min.js'
  'vendor/elementDiff.min.js'
  'vendor/selectorator.min.js'
  'content.js'
]
