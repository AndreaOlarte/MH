require 'rspec'
require_relative '../lib/Cell'
RSpec.describe Cell do
	describe '#toggle_living_status' do
		it 'returns the opposite of the actual living status' do
			cell = Cell.new
			expect(cell.toggle_living_status) == false
		end
  end
  
	describe '#can_reborn?' do
		it 'returns false if it is not dead and/or does not have exactly 3 neighbours alive' do
			cell = Cell.new
			expect (cell.can_reborn? == false)
		end
	end
  
	describe '#can_reborn?' do
		it 'returns true if it is dead and with exactly 3 neighbours alive' do
			cell = Cell.new
			cell.neighbours_quantity = 3
			expect (cell.can_reborn? == true)
		end
	end
  
  describe '#lonely?' do
		it 'returns true if it has less than 2 neighbours alive around' do
			cell = Cell.new
			expect (cell.lonely? == true)
		end
	end
  
  describe '#lonely?' do
		it 'returns false if it has 2 or more neighbours alive around' do
			cell = Cell.new
			cell.neighbours_quantity = 2
			expect (cell.lonely? == false)
		end
	end
  
  describe '#overpopulated?' do
		it 'returns true if it has more than 3 neighbours alive around' do
			cell = Cell.new
			cell.neighbours_quantity = 4
			expect (cell.overpopulated? == true)
		end
	end
  
  describe '#overpopulated?' do
		it 'returns false if it has 3 or less neighbours alive around' do
      cell = Cell.new
			expect (cell.overpopulated? == false)
		end
	end
end
