var panels = chrome.devtools.panels
  , observeElement = function() {
      if(!$0) return;
      if(window.__kzCurrentMutationObserver)
        window.__kzCurrentMutationObserver.disconnect();
      var element = $0
        , observer = new MutationObserver(function(mutations, observer) {
          console.log(mutations, observer);
        });
      window.__kzCurrentMutationObserver = observer;
      observer.observe(document.body, {
        childList: true,
        subtree: true,
        attributes: true,
        characterData: true,
        subtree: true,
        attributeOldValue: true,
        characterDataOldValue: true
      });
      return observer;
    }
    ;

panels.create("Kaizen", "images/icon-128.png", "panel.html");
panels.elements.createSidebarPane("Kaizen", function(sidebar) {
  panels.elements.onSelectionChanged.addListener(function () {
    console.info(observeElement.toString());
    sidebar.setExpression("("+ observeElement.toString() +")()");
  });
});
