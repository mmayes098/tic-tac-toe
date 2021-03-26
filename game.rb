# Second, ask player 1 (X) for their name; and ask player 2 (O) for their name, save to global name variables
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

end

puts "Enter Player 1's (X) name:"
p1 = gets.chomp
puts "Enter Player 2's (O) name:"
p2 = gets.chomp
board = Board.new(3, p1, p2)
board.create
p "The board was created!"
p "#{p1} plays X at 1, 0!"
board.turnX(1, 0)
p "#{p2} plays O at 0, 1!"
board.turnO(0, 1)