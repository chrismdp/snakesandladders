class Board
  def initialize(teleports = {})
    @teleports = teleports
  end
  def destination_of(position)
    return bounce_back_from(position) if position > 100
    @teleports[position] || position
  end
  def winning_position(position)
    position == 100
  end
private
  def bounce_back_from(position)
    100 - (position - 100)
  end
end

