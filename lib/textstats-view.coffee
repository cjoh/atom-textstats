{View} = require 'atom'

module.exports =
class TextstatsView extends View
  editor = atom.workspace.activePaneItem
  text = editor.getText()
  textstatistics = require "text-statistics"
  ts = textstatistics(text)
  @content: ->
    @div class: 'my-package overlay from-top', =>
      @div "Word Count: " + ts.wordCount() +
          " Reading Ease: " + ts.fleschKincaidReadingEase() +
          " Grade Level: " + ts.fleschKincaidGradeLevel(),
          class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "textstats:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "TextstatsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
