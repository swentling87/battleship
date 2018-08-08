require_relative "../../helpers/board_helper"
require_relative '../../models/vessel'

RSpec.describe Vessel, type: :model do
  let(:ship) { Vessel.new(4, "S", "C4") }
  let(:small_ship) { Vessel.new(2, "T", "C4") }
  
  describe "#initialize" do
    it "should generate a Vessel" do
      expect(ship.direction).not_to eq(nil)
      expect(ship.size).to eq(4)
      expect(ship.letter).to eq("S")
      expect(ship.position).to eq("C4")
    end
  end
  
  describe "#build_coordinates" do
    it "should build coordinates for the vessel" do
      expect(ship.long).to eq(nil)
      ship.build_coordinates
      expect(ship.long).not_to eq([])
      expect(ship.lat).not_to eq([])
      expect(ship.coordinates).not_to eq([])
      expect(ship.coordinates.length).to eq(4)
    end
  end
  
  describe "#location_valid?" do
    it "should return that the location is valid" do
      ship.direction = "v"
      expect(ship.location_valid?).to eq(true)
    end
    
    it "should return that the location is invalid due to the size of the ship compared to the location" do
      ship.direction = "v"
      ship.position = "A1"
      expect(ship.location_valid?).to eq(false)
    end
    
    it "should return that the location is invalid due to the size of the ship compared to the location" do
      ship.direction = "h"
      expect(ship.location_valid?).to eq(false)
    end
    
    it "should return that the location is valid" do
      ship.direction = "h"
      expect(small_ship.location_valid?).to eq(true)
    end
  end
  
end
