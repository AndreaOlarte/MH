require 'rspec'
require_relative '../lib/GameOfLife'
RSpec.describe GameOfLife do
	describe '#fill_grid' do
		it 'fills the created array representing the grid of the game with new (dead) cells' do
      game = GameOfLife.new(3, 3)
			expect(game.cells_grid[0][0].is_alive) == false
		end
  end
  
	describe '#place_alive_cell' do
		it 'changes the given cell to alive' do
      game = GameOfLife.new(3, 3)
      game.place_alive_cell(0, 0)
			expect (game.cells_grid[0][0].is_alive == true)
		end
	end
  
  describe '#count_neighbours' do
		it 'counts and set the neighbours quantity of a given cell' do
			game = GameOfLife.new(3, 3)
      game.place_alive_cell(0, 0)
      game.place_alive_cell(1, 0)
			expect (game.count_neighbours(1, 1) == 2)
		end
	end
  
  describe '#cell_exist?' do
		it 'returns true if the position given is valid' do
      game = GameOfLife.new(3, 3)
			expect (game.cell_exist?(1, 2) == true)
		end
	end
  
  describe '#cell_exist?' do
		it 'returns false if the position given is invalid' do
      game = GameOfLife.new(3, 3)
			expect (game.cell_exist?(-1, 5) == false)
		end
	end
  
  describe '#x_position_exist?' do
		it 'returns true if the x-position given is valid' do
      game = GameOfLife.new(3, 3)
			expect (game.x_position_exist?(1) == true)
		end
	end
  
  describe '#x_position_exist?' do
		it 'returns false if the x-position given is invalid' do
      game = GameOfLife.new(3, 3)
			expect (game.x_position_exist?(-1) == false)
		end
	end
  
  describe '#y_position_exist?' do
		it 'returns true if the y-position given is valid' do
      game = GameOfLife.new(3, 3)
			expect (game.y_position_exist?(2) == false)
		end
	end
  
  describe '#y_position_exist?' do
		it 'returns false if the y-position given is invalid' do
      game = GameOfLife.new(3, 3)
			expect (game.y_position_exist?(5) == false)
		end
	end
  
  describe '#update_alive_neighbours' do
		it 'updates the quantity of alive neighbours of every cell in the grid' do
      game = GameOfLife.new(3, 3)
      game.place_alive_cell(0, 0)
      game.place_alive_cell(1, 0)
      game.update_alive_neighbours
			expect (game.cells_grid[1][1].neighbours_quantity == 2)
		end
	end
  
  describe '#iterate' do
		it 'do one tick or iteration of the game: set cell to alive if can reborn' do
      game = GameOfLife.new(3, 3)
      game.place_alive_cell(1, 0)
      game.place_alive_cell(1, 1)
      game.place_alive_cell(1, 2)
      game.update_alive_neighbours
      game.iterate
			expect (game.cells_grid[0][1].is_alive == true)
		end
	end
  
  describe '#iterate' do
		it 'do one tick or iteration of the game: set cell to not alive if is lonely' do
      game = GameOfLife.new(3, 3)
      game.place_alive_cell(1, 0)
      game.place_alive_cell(1, 1)
      game.place_alive_cell(1, 2)
      game.update_alive_neighbours
      game.iterate
			expect (game.cells_grid[1][2].is_alive == false)
		end
	end
  
  describe '#iterate' do
		it 'do one tick or iteration of the game: set cell to not alive if is overpopulated' do
      game = GameOfLife.new(3, 3)
      game.place_alive_cell(0, 1)
      game.place_alive_cell(1, 0)
      game.place_alive_cell(1, 1)
      game.place_alive_cell(1, 2)
      game.place_alive_cell(0, 2)
      game.update_alive_neighbours
      game.iterate
			expect (game.cells_grid[0][1].is_alive == false)
		end
	end
  
  describe '#print_grid' do
		it 'represents the ' do
      game = GameOfLife.new(3, 3)
      game.place_alive_cell(0, 1)
      game.place_alive_cell(1, 0)
      game.place_alive_cell(2, 2)
			expect (game.print_grid == "- * - \n* - - \n- - * \n\n")
		end
	end
end