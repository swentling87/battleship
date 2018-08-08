require_relative "../../helpers/board_helper"

RSpec.describe BoardHelper, type: :helper do
    
  describe "#x_axis" do
    it "should return the x-axis data" do
      expect(BoardHelper.x_axis).to eq(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])
    end
  end
  
  describe "#y_axis" do
    it "should return the y-axis data" do
      expect(BoardHelper.y_axis).to eq((1..10))
    end
  end
  
  describe "#column" do
    it "should return the column letter position (number)" do
      expect(BoardHelper.column("C5")).to eq(3)
    end
  end
  
  describe "#row" do
    it "should return the row number" do
      expect(BoardHelper.row("A5")).to eq(5)
    end
  end
  
end
