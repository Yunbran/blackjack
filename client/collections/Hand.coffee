class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->
    @on('hit', @checkOver, @)
    @

  hit: ->
    tempPop = @deck.pop()
    @add(tempPop).last()
    if @checkOver() then @trigger 'bust'
    # @trigger 'bust'
    # if @checkOver then @trigger 'bust'

  checkOver: ->
    # Score check if over 21 disable hit button
    curScore = @scores()
    if curScore[1]? and curScore <= 21
    then curScore = curScore[1]
    else curScore = curScore[0]

    console.log curScore
    if curScore > 21 then $('.hit-button').attr('disabled', 'disabled')
    if curScore > 21 then true else false

  stand: ->
    $('.hit-button').attr('disabled', 'disabled')
    $('.stand-button').attr('disabled', 'disabled')
    @trigger 'stand'

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]


  aiPlay: ->
    console.log('AI trigger')

