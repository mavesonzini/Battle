
class Player
  attr_reader :name, :hitpoints
  DEFAULT_NAME = "player"
  DEFAULT_HP = 100
  DEFAULT_DAMAGE = 20

  def initialize(name = DEFAULT_NAME, hitpoints = DEFAULT_HP)
    @name = name
    @hitpoints = hitpoints
  end

  def reduce_hitpoints(damage = DEFAULT_DAMAGE)
    @hitpoints -= damage
  end

  def dead?
    hitpoints == 0
  end
end
