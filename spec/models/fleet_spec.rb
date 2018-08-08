require_relative "../../helpers/board_helper"
require_relative '../../models/fleet'
require_relative '../../models/vessel'

RSpec.describe Fleet, type: :model do
  let(:fleet) { Fleet.new }
  let(:ship) { Vessel.new(4, "S", "C4") }
  
  describe "#initialize" do
    it "should generate a Fleet" do
      expect(fleet.vessels.count).to eq(5)
      expect(fleet.occupied_locations).to eq([])
    end
  end
  
  describe "#add_to_fleet" do
    it "should add a vessel to the fleet and populate occupied_locations" do
      ship.build_coordinates
      expect(fleet.occupied_locations).to eq([])
      fleet.add_to_fleet(ship)
      expect(fleet.occupied_locations).not_to eq([])
    end
  end
  
  describe "#coordinates_valid?" do
    it "should return true if coordinates are valid" do 
      ship.build_coordinates
      expect(fleet.occupied_locations).to eq([])
      expect(fleet.coordinates_valid?(ship)).to eq(true)
      fleet.add_to_fleet(ship)
      expect(fleet.coordinates_valid?(ship)).to eq(false)
    end
  end
  
end
