# Fifth, check if anyone has won with three in a row (separate function)
# Seventh, continue taking turns until someone wins, or you get a cat's game
# Last, display results of the game!

class Board
  def initialize(p1, p2)
    @size = 3
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
        self.checkWin
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
        self.checkWin
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
    self.create
    while @turns < 9
      self.getSquare
      @turns += 1
      puts "Nobody wins, it's a cat's game!" if @turns == 9
    end
  end
  
  def checkWin
    @flattened = $board_array.flatten
    if @flattened[0..2] == ["X", "X", "X"]      #check all rows
      puts "Congratulations #{@p1}! You win the game!"
      exit
    elsif @flattened[0..2] == ["O", "O", "O"]
      puts "Congratulations #{@p2}! You win the game!"
      exit
    elsif @flattened[3..5] == ["X", "X", "X"]
      puts "Congratulations #{@p1}! You win the game!"
      exit
    elsif @flattened[3..5] == ["O", "O", "O"]
      puts "Congratulations #{@p2}! You win the game!"
      exit
    elsif @flattened[6..8] == ["X", "X", "X"]
      puts "Congratulations #{@p1}! You win the game!"
      exit
    elsif @flattened[6..8] == ["O", "O", "O"]
      puts "Congratulations #{@p2}! You win the game!"
      exit
    end
    self.checkColumn(@flattened)
    self.checkDiag(@flattened)
  end

  def checkColumn(flattened)
    col1 = []
    col2 = []
    col3 = []
    [0, 3, 6].each { |n| col1 << flattened[n] }
    [1, 4, 7].each { |n| col2 << flattened[n] }
    [2, 5, 8].each { |n| col3 << flattened[n] }

    if col1 == ["X", "X", "X"] || col2 == ["X", "X", "X"] || col3 == ["X", "X", "X"]
      puts "Congratulations #{@p1}! You win the game!"
      exit
    elsif col1 == ["O", "O", "O"] || col2 == ["O", "O", "O"] || col3 == ["O", "O", "O"]
      puts "Congratulations #{@p2}! You win the game!"
      exit
    end
  end
  
  def checkDiag(flattened)
    diag1 = []
    diag2 = []
    diag1.push(flattened[0], flattened[4], flattened[8])
    diag2.push(flattened[2], flattened[4], flattened[6])

    if diag1 == ["X", "X", "X"] || diag2 == ["X", "X", "X"]
      puts "Congratulations #{@p1}! You win the game!"
      exit
    elsif diag1 == ["O", "O", "O"] || diag2 == ["O", "O", "O"]
      puts "Congratulations #{@p2}! You win the game!"
      exit
    end
  end
end

puts "Enter Player 1's (X) name:"
p1 = gets.chomp
puts "Enter Player 2's (O) name:"
p2 = gets.chomp
board = Board.new(p1, p2)
board.play