require File.dirname(__FILE__) + "/spec_helper"

describe Game do
  context "creation" do
    it "accepts a mandatory board parameter and a number of players" do
      lambda { Game.new }.should raise_error
      Game.new(mock(:board, :destination_of => mock), mock(:playercount))
    end

    it "allows the setting of a player position to an arbitrary value" do
      game = Game.new(mock(:board, :destination_of => mock), 1)
      game.set_player_position(2, 50)
      game.player_position(2).should == 50
    end
  end

  context "playing" do
    before do
      @board = mock(:board)
      @board.stub!(:destination_of).with(4).and_return(4)
      @board.stub!(:destination_of).with(3).and_return(3)
    end

    it "rolling the dice several times allows many players to move" do
      game = Game.new(@board, 2)
      game.roll(4)
      game.roll(3)
      game.player_position(1).should == 4
      game.player_position(2).should == 3
    end
    
    it "rolling a six allows another go" do
      @board.stub!(:destination_of).with(6).and_return(6)
      @board.stub!(:destination_of).with(12).and_return(12)
      @board.stub!(:destination_of).with(15).and_return(15)
      game = Game.new(@board, 3)
      game.roll(6)
      game.roll(6)
      game.roll(3)
      game.player_position(1).should == 15
      game.player_position(2).should == 0
    end
  end
  context "snakes and ladders" do
    it "respects the snakes and ladders of the given board" do
      board = mock(:board)
      game = Game.new(board, 1)
      board.stub!(:destination_of).and_return(3)
      game.roll(1)
      game.player_position(1).should == 3
    end
  end
  context "winning" do
    before do
      @board = mock(:board, :winning_position => false)
      @game = Game.new(@board, 1)
    end

    it "has no winner when no-one has reached 100" do
      @game.winner.should == nil
    end
    it "has a winner when someone reaches 100" do
      @board.stub!(:winning_position).and_return true
      @game.winner.should == 1
    end
  end
end
