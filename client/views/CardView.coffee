class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src="img/cards/<%= typeof(rankName) === "string" ?  rankName.charAt(0).toLowerCase()+rankName.slice(1) : rankName %>-<%= suitName.charAt(0).toLowerCase()+suitName.slice(1) %>.png" />'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
