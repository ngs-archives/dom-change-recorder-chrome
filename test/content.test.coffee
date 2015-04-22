describe 'kzEditor', ->
  subject = editor = null
  beforeEach ->
    editor = -> window.__kzEditor
    subject = -> do editor
  it 'kzEditor should be defined in global', ->
    expect(subject()).not.toBeUndefined()

