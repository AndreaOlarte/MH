require_relative './Board.rb'

class Game 
    attr_accessor :board, :players, :passedTurns, :gameOn
    def initialize
        @gameOn = false
        @players = [-1, 1] #Hold the mark of the players
        @board = Board.new(3) #Makes tictactoe board
        @UIarray = [[0,0], [1,0], [2,0], [0,1], [1,1], [2,1], [0,2], [1,2], [2,2]] #Hold the coordenates related to the slot number position
    end

    def playAgain
        print "Want to keep playing? ('Y' for YES, evth else for NO): "
        if gets.chomp.downcase == 'y' then true else false end
    end
    
    def showPlayerTurns
        # Tells user who is first and who is the second to go
        if players[0] == -1
            puts "Player 1: X\nPlayer 2: O"
        else
            puts "Player 1: O\nPlayer 2: X"
        end
    end
    
    def getPosition
        print "Player #{@passedTurns%2+1} enter the the slot number where you want to put your mark: "
        x = gets.chomp.to_i
        until(x > 0 && x < 10) # Check if valid position
            puts "INVALID OR NOT A NUMBER"
            print "Enter only numbers between 1 an 9, where you want to put your mark: "
            x = gets.chomp.to_i
        end
        until @board.available(@UIarray[x-1][1], @UIarray[x-1][0])
            puts "SLOT NOT AVAILABLE, TRY ANOTHER ONE"
            print "Enter the slot number where you want to put your mark: "
            x = gets.chomp.to_i 
        end
        x
    end
    
    def startGame
        showPlayerTurns
        @gameOn = true
        @passedTurns = 0
        @board.printUIBoard #Prints board slot position to choose to put the mark on
        @board.printBoard
        while(@gameOn && @passedTurns < 9)
            pos = getPosition
            @board.setFigureOnBoard(@UIarray[pos - 1][1], @UIarray[pos - 1][0], players[@passedTurns % 2]) #
            @board.printBoard
            if @board.checkStatus
                puts "WINNER Player #{@passedTurns%2+1}"
                if playAgain
                    restart(players[@passedTurns%2])
                else
                    gameOver
                end
            else
                @passedTurns += 1
            end
        end
        checkIfTie
    end

    def checkIfTie
        if @passedTurns == 9 #Check if game finished because there are no more moves
            puts "It's a TIE"
            if playAgain
                restart(players[(@passedTurns - 1) % 2])
            else
                gameOver                
            end
        end
    end

    def gameOver
        @gameOn = false # Finish game
        puts "GAME OVER"
    end

    def restart(player)
        # Change first and second player according to the rules
        @players[0] = (-1 * player)
        @players[1] = player
        @board.cleanBoard
        startGame
    end
end

game = Game.new
game.startGame