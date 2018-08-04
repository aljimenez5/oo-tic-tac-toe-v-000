class TicTacToe

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
    return user_input
  end
  
  def move(user_input, token="X")
    @board[user_input] = token
  end
  
  def position_taken?(user_input)
    if @board[user_input] == "X" || @board[user_input] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(user_input)
    if position_taken?(user_input) == false && user_input.between?(0, 8)
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    new_user_input = input_to_index(user_input)
    if valid_move?(user_input) == true
      move(user_input, current_player)
      display_board
    else
      turn
    end 
  end

  def turn_count
    counter = @board.count("X") + @board.count("O")
    return counter
  end

  def current_player
    if turn_count(@board) == 1
      return "O"
    elsif turn_count(@board) % 2 == 0
      return "X"
    else turn_count(@board) % 3 == 0
      return "O"
    end
  end

  def won?
    for combination in WIN_COMBINATIONS do
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X" || @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O" 
        return combination
      end
    end
    return false
  end
  
  def full?
    @board.none? { |empty_index| empty_index == " "}
  end
  
  def draw?
    if full?(@board) && !won?(@board)
      return true
    else
      return false
    end
  end
  
  def over?
    if won?(@board) || draw?(@board) || full?(@board) 
      return true
    else
      return false
    end
  end
  
  def winner
    if won?(@board) 
      @board[won?(@board)[0]]
    end
  end
  
  def play
    until over?(@board) do
      turn(@board)
    end
      if won?(@board) 
        win = winner(@board)
        puts "Congratulations #{win}!"
      elsif draw?(@board)
        puts "Cat's Game!"
      end
  end
  
end  