require_relative "../../helpers/board_helper"
require_relative '../../models/board'

RSpec.describe Board, type: :model do
  let(:fleet) { Fleet.new }
  let(:board) { Board.new(fleet) }
  
  describe "#initialize" do
    it "should generate a Board" do
      expect(board.fleet).to eq(fleet)
      expect(board.board).to eq([])
    end
  end
  
  describe "#generate_board" do
    it "should output a board" do
      expect(board.board.length).to eq(0)
      board.set_fleet
      board.generate_board
      expect(board.board.length).to eq(10)
    end
  end
  
  describe "#display_board" do
    it "should output a board" do
      board.set_fleet
      board_matrix = board.generate_board
      expect(board.display_board(board_matrix)).to be_a_kind_of(String)
    end
  end
  
  describe "#set_fleet" do
    it "should set the fleet positions" do
      expect(board.fleet.vessels.count).to eq(5)
      expect_any_instance_of(Fleet).to receive(:add_to_fleet).exactly(5).times
      board.set_fleet
    end
  end
  
end
