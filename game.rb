#!/usr/bin/env ruby
require_relative 'player'
require 'tty'
require 'pry'

class Game

  def initialize

    print "\n####################################################\n"
    @prompt = TTY::Prompt.new
    new_game?

  end

  def new_game?

    @start = begin
               @prompt.yes?("\n  Would you like to start a new game of WAR?") {|q| q.default true}
             rescue
               retry
             end
    exit unless @start == true

    set
    play

  end

  def set

    @player1 = Player.new('Piotr')
    @player2 = Player.new('Yuri')
    @player1.wins = 0
    @player2.wins = 0
    @winning = ''
    Players.shuffle(@player1,@player2)

  end

  def play

    52.times do |round|

      @hand = Players.draw(@player1,@player2)

      case resolve ( @hand )

        when @player1 # wins the hand
          @player1.wins += 1

        when @player2 # wins the hand
          @player2.wins += 1

      end

    end

    tally

  end

  def resolve(hand)

    hand.first > hand.last ? @player1 : @player2

  end

  def tally

    @winning = @player1.wins > @player2.wins ? @player1 : @player2
    print "\n  #{@winning.name} won overall with #{@winning.wins} out of 52.\n"
    new_game?

  end

end

Game.new

print "\n"
