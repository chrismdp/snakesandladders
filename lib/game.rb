class Game
  def initialize(board, player_count)
    @board = board
    @player_count = player_count
    @turn_count = 0
    @player_position = Hash.new(0)
  end

  def roll(dice_value)
    destination = @board.destination_of(player_position(next_player) + dice_value)
    set_player_position(next_player, destination)
    @turn_count += 1 unless dice_value == 6
  end

  def player_position(player)
    @player_position[player] 
  end

  def next_player
    (@turn_count % @player_count) + 1 
  end

  def set_player_position(player, position)
    @player_position[player] = position
  end

  def winner
    @player_count.times do |count|
      player = count + 1
      return player if @board.winning_position(player_position(player))
    end
    nil
  end
end
