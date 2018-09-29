# Conway's Game of Life

Ruby program of the famous game of life invented by the mathematician John Horton Conway

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ruby running on your local machine to try the program or an online ruby environment.
[Download Ruby](https://www.ruby-lang.org/en/downloads/)
[Online Ruby Editor and IDE](https://repl.it/repls/OutlyingImperturbableTheories)

### Installing

For having the program running it is only needed to download the lib files, specifically this ones:

```
Cell.rb
GameOfLife.rb
```

If `main.rb` is downloaded too, it can be used to directly run the program (it has an implementation of the game).

Otherwise, it is important to include the ruby classes on your project

```
require_relative 'GameOfLife.rb'
```

To use the class, create a new instance of the `GameOfLife` ruby class. Make sure to include the width and height you want the grid to have
```
game = GameOfLife.new(5, 5)
```

It will automatically create the grid and fill it with unactive or dead cells. Setting alive cells in the grid it is done as shown:
```
game.place_alive_cell(2, 2)
```
where the given arguments refer to the x-position and y-position where the cell you want alive is located.
The x-axis is the horizontal one, starts on 0 and goes from left to right
The y-axis is the vertical one, starts on 0 and goes from top to left

Once you are done with setting the alive cells, you can start performing iteration by iteration of the game as shown:
```
game.next_iteration
puts game.print_grid
```
The method `print_grid` will return the string representation of the current grid to be used for a command line interface.

## Running the tests

Tests of the classes are included.

## Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Rspec](http://rspec.info/)

## Author

* **Andrea Olarte Vargas** - *Assignment 1. Activity 2*: *MagmaHackers* Program
