module BoardHelper
  
  def BoardHelper.x_axis
    ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
  end
  
  def BoardHelper.y_axis
    (1..10)
  end
  
  def BoardHelper.column(position)
    x_axis.index(position[0]) + 1
  end

  def BoardHelper.row(position)
    position[-1].to_i
  end
end