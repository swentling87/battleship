require_relative './fleet'

class Board
  attr_accessor :board, :fleet

  def initialize(fleet)
    @fleet = fleet
    @board = []
  end

  def generate_board
    10.times do
      board << (0..10).map {|x| "."}
    end
    @fleet.vessels.each do |vessel|
      vessel.size.times do |i|
        row = (vessel.direction == "h") ? BoardHelper.row(vessel.position) - 1 : BoardHelper.row(vessel.position) - 1 + i
        column = (vessel.direction == "h") ? BoardHelper.column(vessel.position) - 1+ i : BoardHelper.column(vessel.position) - 1
        board[row][column] = vessel.letter
      end
    end
    @board = board
  end

  def display_board(matrix)
    board_str = header
    matrix.each_with_index do |x, i|
      board_str += <<-data
     #{i+1} #{" " if i != 9}| #{x[0]} | #{x[1]} | #{x[2]} | #{x[3]} | #{x[4]} | #{x[5]} | #{x[6]} | #{x[7]} | #{x[8]} | #{x[9]} |
        |---|---|---|---|---|---|---|---|---|---|
      data
    end
    footer(board_str)
  end
  
  def set_fleet
    @fleet.vessels.each do |vessel|
      set_vessel_position(vessel)
    end
  end
  
  private
  
  def header
    <<-header
        Welcome to Battleship!
        
          A   B   C   D   E   F   G   H   I   J
        *****************************************
      header
  end
  
  def footer(board_str)
    board_str += <<-footer
        *****************************************
      footer
  end
  
  def random_coordinates
    "#{x_coordinate}#{y_coordinate}"
  end

  def x_coordinate
    BoardHelper.x_axis.shuffle.sample
  end

  def y_coordinate
    BoardHelper.y_axis.to_a.shuffle.sample
  end
  
  def set_vessel_position(vessel)
    vessel.position = random_coordinates
    vessel.build_coordinates
    while !(vessel.location_valid? && @fleet.coordinates_valid?(vessel))
      vessel.position = random_coordinates
      vessel.build_coordinates
    end
    @fleet.add_to_fleet(vessel)
  end
end