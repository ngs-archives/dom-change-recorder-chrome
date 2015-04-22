kzEditor = window.__kzEditor = {}
kzEditor.$ = $ = jQuery = window.$.noConflict()

kzEditor.handleMutation = (mutations) ->
  for mutation in mutations
    console.info $(mutation.target)
  return
