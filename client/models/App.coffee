#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    # @get 'playerHand'.on('bust', ->);
    @get 'playerHand'
    .on('bust', (-> console.log 'busted' ), @)

    # @get 'dealerHand'
    # .on('aiPlay', (-> (@get 'dealerHand').aiPlay() ), @)

    @get 'dealerHand'
    .on('aiPlay', (-> cxt = @get 'dealerHand'; cxt.aiPlay() ), @)

    @get 'playerHand'
    .on('stand', (-> (@get 'dealerHand').trigger 'aiPlay' ), @)

    @
