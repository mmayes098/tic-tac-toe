# Third, display current player name underneath the board and ask for their vertical column (0-2) and horizontal column (0-2) and save to play variables within the turn fucntion
# 3.5, check if that is a proper move (nobody has already put a symbol there)
# Fourth, display proper symbol at the correct spot on the board, redraw the current board
# Fifth, check if anyone has won with three in a row (separate function)
# Sixth, ask next player for their turn
# Seventh, continue taking turns until someone wins, or you get a cat's game
# Last, display results of the game!

class Board
  def initialize(size, p1, p2)
    @size = size
    @p1 = p1
    @p2 = p2
    @current_player = "X"
    @turns = 0
  end

  def create
    $board_array = []
    (0...@size).each do |vertical|
      $board_array << []
      (0...@size).each do |horizontal|
        $board_array[vertical] << "_"
      end
      p $board_array[vertical]
    end
  end

  def turnX(vertical, horizontal)
    $board_array[vertical][horizontal] = "X"
    (0...@size).each { |num| p $board_array[num] }
  end

  def turnO(vertical, horizontal)
    $board_array[vertical][horizontal] = "O"
    (0...@size).each { |num| p $board_array[num] }
  end

  def getSquare
    if @current_player == "X"
      puts "#{@p1}, where would you like to make your X?"
      puts "Which row first (0-2): "
      @vertical = gets.chomp.to_i
      puts "Which column next (0-2): "
      @horizontal = gets.chomp.to_i
      if self.validSquare(@vertical, @horizontal)
        self.turnX(@vertical, @horizontal)
        @current_player = "O"
      end
    elsif @current_player == "O"
      puts "#{@p2}, where would you like to make your O?"
      puts "Which row first (0-2): "
      @vertical = gets.chomp.to_i
      puts "Which column next (0-2): "
      @horizontal = gets.chomp.to_i
      if self.validSquare(@vertical, @horizontal)
        self.turnO(@vertical, @horizontal)
        @current_player = "X"
      end
    end
  end

  def validSquare(vertical, horizontal)
    return true if $board_array[vertical][horizontal] == "_"

    puts "That isn't a valid move!"
    self.getSquare
  end

  def play
    while @turns < 9
      self.getSquare
      @turns += 1
    end
  end
  
  def checkWin
    if $board_array[0][0] && $board_array[0][1] && $board_array[0][2] == "X"  #checks all rows
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[0][0] && $board_array[0][1] && $board_array[0][2] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    elsif $board_array[1][0] && $board_array[1][1] && $board_array[1][2] == "X"
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[1][0] && $board_array[1][1] && $board_array[1][2] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    elsif $board_array[2][0] && $board_array[2][1] && $board_array[2][2] == "X"
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[2][0] && $board_array[2][1] && $board_array[2][2] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    end

    if $board_array[0][0] && $board_array[1][0] && $board_array[2][0] == "X"  #checks all columns
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[0][0] && $board_array[1][0] && $board_array[2][0] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    elsif $board_array[0][1] && $board_array[1][1] && $board_array[2][1] == "X"
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[0][1] && $board_array[1][1] && $board_array[2][1] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    elsif $board_array[0][2] && $board_array[1][2] && $board_array[2][2] == "X"
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[0][2] && $board_array[1][2] && $board_array[2][2] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    end

    if $board_array[0][0] && $board_array[1][1] && $board_array[2][2] == "X"  #checks diagonals
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[0][0] && $board_array[1][1] && $board_array[2][2] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    elsif $board_array[0][2] && $board_array[1][1] && $board_array[2][0] == "X"
      puts "Congratulations #{@p1}! You win the game!"
    elsif $board_array[0][2] && $board_array[1][1] && $board_array[2][0] == "O"
      puts "Congratulations #{@p2}! You win the game!"
    end
  end
end

puts "Enter Player 1's (X) name:"
p1 = gets.chomp
puts "Enter Player 2's (O) name:"
p2 = gets.chomp
board = Board.new(3, p1, p2)
board.create
board.play
# p "The board was created!"
# p "#{p1} plays X at 1, 0!"
# board.turnX(1, 0)
# p "#{p2} plays O at 0, 1!"
# board.turnO(0, 1)
# board.getSquare
# board.turnX(0, 0)
# board.turnX(1, 1)
# board.turnX(1, 2)
# board.checkWin