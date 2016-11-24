
class Player
  attr_reader :name, :hitpoints

  def initialize(name, hitpoints = 100)
    @name = name
    @hitpoints = hitpoints
  end

  def attack(player)
    player.reduce_hitpoints(10)
  end

  def reduce_hitpoints(number)
    @hitpoints -= number
  end

end
