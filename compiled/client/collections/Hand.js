// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Hand = (function(_super) {
    __extends(Hand, _super);

    function Hand() {
      return Hand.__super__.constructor.apply(this, arguments);
    }

    Hand.prototype.model = Card;

    Hand.prototype.initialize = function(array, deck, isDealer) {
      this.deck = deck;
      this.isDealer = isDealer;
      this.on('hit', this.checkOver, this);
      return this;
    };

    Hand.prototype.hit = function() {
      var tempPop;
      tempPop = this.deck.pop();
      this.add(tempPop).last();
      if (this.checkOver()) {
        return this.trigger('bust');
      }
    };

    Hand.prototype.checkOver = function() {
      var curScore;
      curScore = this.scores();
      if ((curScore[1] != null) && curScore <= 21) {
        curScore = curScore[1];
      } else {
        curScore = curScore[0];
      }
      console.log(curScore);
      if (curScore > 21) {
        $('.hit-button').attr('disabled', 'disabled');
      }
      if (curScore > 21) {
        return true;
      } else {
        return false;
      }
    };

    Hand.prototype.stand = function() {
      $('.hit-button').attr('disabled', 'disabled');
      $('.stand-button').attr('disabled', 'disabled');
      return this.trigger('stand');
    };

    Hand.prototype.scores = function() {
      var hasAce, score;
      hasAce = this.reduce(function(memo, card) {
        return memo || card.get('value') === 1;
      }, false);
      score = this.reduce(function(score, card) {
        return score + (card.get('revealed') ? card.get('value') : 0);
      }, 0);
      if (hasAce) {
        return [score, score + 10];
      } else {
        return [score];
      }
    };

    Hand.prototype.aiPlay = function() {
      return console.log('AI trigger');
    };

    return Hand;

  })(Backbone.Collection);

}).call(this);
