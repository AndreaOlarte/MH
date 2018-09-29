require_relative './Cell.rb'
require_relative './GameOfLife.rb'

print 'Enter the width you want for the grid: '
grid_width = gets.chomp.to_i
print 'Enter the height you want for the grid: '
grid_height = gets.chomp.to_i
game = GameOfLife.new(grid_width, grid_height)

placed_cells = 0
keep_placing_cells = true
while keep_placing_cells && placed_cells < grid_width * grid_height
  puts "Placed cells: #{placed_cells}"
  print 'Enter the X-Position of the cell you want to leave alive: '
  x_position = gets.chomp.to_i - 1
  print 'Enter the Y-Position of the cell you want to leave alive: '
  y_position = gets.chomp.to_i - 1
  game.place_alive_cell(x_position, y_position)
  placed_cells += 1
  puts game.print_grid
  print 'Do you want to place one more alive cell? Enter "Y" for YES: '
  keep_placing_cells = gets.chomp.casecmp('y').zero?
end

# next_iteration = true
print 'Enter "N" to PERFORM next iteration, everything else to STOP: '
next_iteration = gets.chomp.casecmp('n').zero?
while next_iteration
  game.next_iteration
  puts game.print_grid
  print 'Enter "N" to PERFORM the next iteration, everything else to STOP: '
  next_iteration = gets.chomp.casecmp('n').zero?
end

puts 'GAME STOPPED'
