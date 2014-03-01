TextstatsView = require './textstats-view'

module.exports =
  textstatsView: null

  activate: (state) ->
    @textstatsView = new TextstatsView(state.textstatsViewState)

  deactivate: ->
    @textstatsView.destroy()

  serialize: ->
    textstatsViewState: @textstatsView.serialize()
