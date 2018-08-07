require_relative './vessel'

class Fleet
  attr_reader :occupied_locations, :vessels
  
  def initialize
    @vessels = build_fleet
    @occupied_locations = []
  end

  def add_to_fleet(vessel)
    @occupied_locations += vessel.coordinates
  end

  def coordinates_valid?(vessel)
    !(vessel.coordinates & @occupied_locations).empty? ? false : true
  end
  
  private
  
  def build_fleet
    cruiser = Vessel.new(5, "C")
    battleship = Vessel.new(4, "B")
    destroyer = Vessel.new(3, "D")
    submarine = Vessel.new(3, "S")
    tugboat = Vessel.new(2, "T")
    [cruiser, battleship, destroyer, submarine, tugboat]
  end
end