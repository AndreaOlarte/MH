# Class representing the cells in the Game of Life
class Cell
  attr_accessor :is_alive, :neighbours_quantity, :neighbours
  def initialize
    @is_alive = false
    @neighbours_quantity = 0 # Maybe not need of this and better have an array with the neighbours Cells: @neighbours = []
    @neighbours = []
  end

  def toggle_living_status
    @is_alive = @is_alive ? false : true
  end

  def can_reborn?
    !@is_alive && @neighbours_quantity == 3
  end

  def lonely?
    @is_alive && @neighbours_quantity < 2
  end

  def overpopulated?
    @is_alive && @neighbours_quantity > 3
  end
end
