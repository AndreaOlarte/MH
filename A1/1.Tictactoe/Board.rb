class Board
  attr_accessor :size, :board, :sumCol, :sumRow, :sumDiag
  def initialize(size)
    @size = size
    @board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    @sumCol = [0, 0, 0]
    @sumRow = [0, 0, 0]
    @sumDiag = [0, 0]
  end

  # SET MARK ON BOARD and update sums
  def setFigureOnBoard(posx, posy, value)
    @board[posx][posy] = value
    @sumCol[posx] += value
    @sumRow[posy] += value
    @sumDiag[0] += value if posx == posy
    @sumDiag[1] += value if posx + posy == 2
  end

  def checkStatus
    return true if checkCols || checkRows || checkDiags

    false
  end

  def checkCols
    @sumCol.each do |sum|
      return true if sum.abs == 3
    end
    false
  end

  def checkRows
    @sumRow.each do |sum|
      return true if sum.abs == 3
    end
    false
  end

  def checkDiags
    @sumDiag.each do |sum|
      return true if sum.abs == 3
    end
    false
  end

  def available(posx, posy)
    (@board[posx][posy] == 0)
  end

  def printUIBoard
    counter = 1
    puts "\nBOARD SLOT POSITIONS TO SET MARKS ON\n-----------"
    @board.each do |row|
      row.each  do |_slot|
        print " #{counter} |"
        counter += 1
      end
      puts "\n-----------"
    end
  end

  def printBoard
    puts "\n-----------"
    @board.each do |row|
      row.each do |slot|
        if slot == -1
          print ' X |'
        elsif slot == 1
          print ' O |'
        else
          print '   |'
        end
      end
      puts "\n-----------"
    end
  end

  def cleanBoard
    0.upto(@size - 1) do |x|
      0.upto(@size - 1) do |y|
        @board[x][y] = 0
      end
      @sumCol[x] = 0
      @sumRow[x] = 0
    end
    @sumDiag[0] = 0
    @sumDiag[1] = 0
  end
end
