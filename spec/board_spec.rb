require File.dirname(__FILE__) + "/spec_helper"

describe Board do
  context "creation" do
    it "accepts a table of snakes and ladders" do
      Board.new(1 => 2, 4 => 5)
    end
  end
  context "destination calculation" do
    it "returns identity if it cannot find an entry for it" do
      board = Board.new
      board.destination_of(4).should == 4
    end
    it "returns the target position if a source position is found" do
      board = Board.new 4 => 8
      board.destination_of(4).should == 8
    end
    it "sends the player back if they go over 100" do
      board = Board.new
      board.destination_of(102).should == 98
      board.destination_of(105).should == 95
    end
  end
  context "winning position" do
    it "returns 100 as a winning position" do
      board = Board.new
      board.winning_position(100).should == true
    end

    it "returns all other positions as not winning" do
      Board.new.winning_position(101).should == false
      Board.new.winning_position(99).should == false
    end
  end
end