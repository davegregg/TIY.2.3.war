require_relative 'deck'
require 'pry'

class Player
  attr_accessor :name, :deck, :wins

  def initialize(name, wins=0)
    @name = name
    @wins = wins
    @deck = Deck.new
  end

  class << self

    def shuffle(player1,player2)
      player1.deck.shuffle!
      player2.deck.shuffle!
    end

    def draw(player1,player2)
      [ player1.deck.draw!, player2.deck.draw! ]
    end

  end

end

Players = Player
