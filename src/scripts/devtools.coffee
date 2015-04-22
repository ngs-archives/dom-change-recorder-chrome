panels = chrome.devtools.panels

observeElement = ->
  if window.__kzCurrentMutationObserver
    window.__kzCurrentMutationObserver.disconnect()
    delete window.__kzCurrentMutationObserver
  return if !$0 or document.readyState != 'complete'
  element = $0
  observer = new MutationObserver (mutations, observer) ->
    if window.__kzEditor
      window.__kzEditor.handleMutation mutations
    return
  observer.observe element.parentNode,
    childList: true
    subtree: true
    attributes: true
    characterData: true
    subtree: true
    attributeOldValue: true
    characterDataOldValue: true
  window.__kzCurrentMutationObserver = observer

panels.create 'Kaizen', 'images/icon-128.png', 'panel.html'
panels.elements.createSidebarPane 'Kaizen', (sidebar) ->
  panels.elements.onSelectionChanged.addListener ->
    sidebar.setExpression '(' + observeElement.toString() + ')()'
    return
  return
