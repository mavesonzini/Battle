require_relative 'player'

class Game

  attr_reader :players, :turn
  private_class_method :new

  def initialize(name1, name2, player_klass = Player)
    @players = [player_klass.new(name1), player_klass.new(name2)]
    @turn = true
  end
  
  def attack(player)
    player.reduce_hitpoints(20)
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

  def self.play
    @@game
  end

  def self.start_game(name1, name2)
    @@game = Game.new(name1, name2)
  end

end
