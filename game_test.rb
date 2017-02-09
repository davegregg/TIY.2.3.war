require 'minitest/autorun'
require_relative 'game'

class GameTest < MiniTest::Test

  def setup
    # @mycard = Card.new(12,'K','♣')
    # @hercard = Card.new(10,'10','♦')
  end

  def test_play
    assert (@mycard <=> @hercard) == 1
  end

end
