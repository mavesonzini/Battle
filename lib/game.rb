require_relative 'player'

class Game

  attr_reader :players, :turn

  def initialize(player1, player2)
    @players = [player1, player2]
    @turn = true
  end

  def attack(player)
    player.reduce_hitpoints(10)
  end

  def player1
    players[0]
  end

  def player2
    players[1]
  end

  def switch_player
    @turn = !@turn
  end

end
