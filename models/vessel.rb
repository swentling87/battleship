require_relative '../helpers/board_helper'

class Vessel
  attr_accessor :size, :letter, :position, :direction
  attr_reader :long, :lat, :coordinates
  
  def initialize(size, letter, position = nil)
    @size = size
    @letter = letter
    @position = position
    @direction = generate_direction
    @coordinates = []
  end
  
  def build_coordinates
    # X axis
    @long = []
    # Y axis
    @lat = []
    @coordinates = []
    @size.times do |i|
      lat_value = horizontal? ? BoardHelper.row(@position) : BoardHelper.row(@position) + i
      long_value = horizontal? ? BoardHelper.column(@position) + i : BoardHelper.column(@position)
      @long << long_value
      @lat << lat_value
    end
    @long.each_with_index do |x, i|
      @coordinates[i] = "#{x}#{@lat[i]}"
    end
  end
  
  def location_valid?
    max_boundary = 11 - @size
    min_boundary = @size
    
    if (( horizontal? && BoardHelper.column(@position) > max_boundary) || (vertical? && BoardHelper.row(@position) > max_boundary)) || (( horizontal? && BoardHelper.column(@position) < min_boundary) || (vertical? && BoardHelper.row(@position) < min_boundary)) || (BoardHelper.column(@position) > 10 || BoardHelper.row(@position) > 10)
      false
    else
      true
    end
  end

  private
  
  def horizontal?
    @direction == "h"
  end
  
  def vertical?
    @direction == "v"
  end
  
  def generate_direction
    @direction ||= ['h', 'v'].sample
  end

end