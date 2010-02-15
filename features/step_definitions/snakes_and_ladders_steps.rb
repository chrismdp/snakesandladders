Given /^a board with:$/ do |table|
  teleports = {}
  table.raw.each do |row|
    teleports[row[1].to_i] = row[2].to_i
  end
  @board = Board.new(teleports)
end

Given /^I start a game with (\d+) players$/ do |player_count|
  @game = Game.new(@board, player_count.to_i)
end

Given /^player \d+ rolls (.*)$/ do |dice_value|
  @game.roll(dice_value.to_i)
end

Then /^player (.+?) is now on position (.*)$/ do |player, position|
  @game.player_position(player.to_i).should == position.to_i
end

Given /^player (.+?) is on position (\d+)$/ do |player, position|
  @game.set_player_position(player.to_i, position.to_i)
end

Then /^it is now player (\d+)'s go$/ do |player|
  @game.next_player.should == player.to_i
end

Then /^player 1 has won the game$/ do
  @game.winner.should == 1
end

