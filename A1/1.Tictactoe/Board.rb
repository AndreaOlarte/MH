class Board
    attr_accessor :size, :board, :sumCol, :sumRow, :sumDiag
    def initialize(size)
        @size = size
        @board = [[0,0,0],[0,0,0],[0,0,0]]
        @sumCol = [0,0,0]
        @sumRow = [0,0,0]
        @sumDiag = [0,0]
    end
    # SET MARK ON BOARD and update sums
    def setFigureOnBoard(posx, posy, value)
        @board[posx][posy] = value
        @sumCol[posx] += value
        @sumRow[posy] += value
        if posx == posy
            @sumDiag[0] += value
        end
        if posx + posy == 2
            @sumDiag[1] += value
        end
    end
    
    def checkStatus
        if checkCols || checkRows || checkDiags
            true
        else
            false
        end
    end

    def checkCols
        gameWon = false
        @sumCol.each do |sum|
            if sum.abs == 3
                gameWon = true
                break
            end
        end
        gameWon
    end
    def checkRows
        gameWon = false
        @sumRow.each do |sum|
            if sum.abs == 3
                gameWon = true
                break
            end
        end
        gameWon
    end
    def checkDiags
        gameWon = false
        @sumDiag.each do |sum|
            if sum.abs == 3
                gameWon = true
                break
            end
        end
        gameWon
    end

    def available(posx, posy)
        (@board[posx][posy] == 0)
    end

    def printUIBoard
        counter = 1
        puts "\nBOARD SLOT POSITIONS TO SET MARKS ON\n-----------"
        @board.each { |row|
            row.each{ |slot|
                print " #{counter} |"
                counter += 1
            }
            puts "\n-----------"
        }
    end

    def printBoard
        puts "\n-----------"
        @board.each { |row|
            row.each{ |slot|
                if slot == -1
                    print " X |"
                elsif slot == 1
                    print " O |"
                else
                    print "   |"
                end
            }
            puts "\n-----------"
        }
    end

    def cleanBoard
        for x in 0...@size do
            for y in 0...@size do
                @board[x][y] = 0
            end
            @sumCol[x] = 0
            @sumRow[x] = 0
        end
        @sumDiag[0] = 0
        @sumDiag[1] = 0
    end

end