require_relative './Cell.rb'

# Class representing the game of life
class GameOfLife
  attr_accessor :cells_grid
  def initialize(grid_width, grid_height)
    @grid_width = grid_width
    @grid_height = grid_height
    @cells_grid = Array.new(@grid_width) { Array.new(@grid_height) }
    fill_grid
  end

  def fill_grid
    @grid_width.times do |column_number|
      @grid_height.times do |row_number|
        @cells_grid[column_number][row_number] = Cell.new
      end
    end
  end

  def place_alive_cell(x_position, y_position)
    @cells_grid[x_position][y_position].toggle_living_status unless 
    @cells_grid[x_position][y_position].is_alive
  end

  def count_neighbours(x_position, y_position)
    neighbours_counter = 0
    (-1..1).each do |x_index|
      (-1..1).each do |y_index|
        neighbour_x = x_position + x_index
        neighbour_y = y_position + y_index
        if cell_exist?(neighbour_x, neighbour_y) && @cells_grid[neighbour_x][neighbour_y].is_alive
          neighbours_counter += 1
          # With neighbours array instead of quantity of neighbours on cell, use:
          # @cells_grid[x_position][y_position].neighbours.push(@cells_grid[neighbour_x][neighbour_y])
        end
      end
    end
    neighbours_counter -= @cells_grid[x_position][y_position].is_alive ? 1 : 0
  end

  def cell_exist?(x_position, y_position)
    x_position_exist?(x_position) && y_position_exist?(y_position)
  end

  def x_position_exist?(x_position)
    x_position >= 0 && x_position < @grid_width
  end

  def y_position_exist?(y_position)
    y_position >= 0 && y_position < @grid_height
  end

  def next_iteration
    update_alive_neighbours
    iterate
  end

  def update_alive_neighbours
    @grid_width.times do |column_number|
      @grid_height.times do |row_number|
        @cells_grid[column_number][row_number].neighbours_quantity = count_neighbours(column_number, row_number)
      end
    end
  end

  def iterate
    @cells_grid.each do |array|
      array.each do |cell|
        if cell.can_reborn? || cell.lonely? || cell.overpopulated?
          cell.toggle_living_status
        end
      end
    end
  end

  def print_grid
    grid_interface = ''
    @grid_height.times do |column_number|
      @grid_width.times do |row_number|
        grid_interface += @cells_grid[row_number][column_number].is_alive ? '* ' : '- '
      end
      grid_interface += "\n"
    end
    grid_interface += "\n"
  end
end
