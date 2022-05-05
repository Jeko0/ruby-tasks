REPEATE_COUNT = 9
TURN_SWITCHER = 2
NEXT_TURN = 1

class Game
  @@PLAYER_ONE = 0
  @@PLAYER_TWO = 1

  attr_accessor :board, :row_index, :col_index, :turn

  def initialize
    @row_index = %w[A B C]
    @col_index = %w[D E F]
    @board = Array.new(3) { Array.new(3) }
    @turn = @@PLAYER_ONE
  end

  def make_move(_board, row, col, turn)
    print turn == @@PLAYER_ONE ? "First player's turn: " : "Second player's turn: "

    loop do
      move = gets.chomp.upcase.chars.sort
      # need help with this one :) 
      if @board[row.index(move[0])][col.index(move[1])].nil?
        @board[row.index(move[0])][col.index(move[1])] = (turn == @@PLAYER_ONE ? 'X' : 'O')
        return
      end
      print 'Spot taken. Try again: '
    rescue StandardError
      print 'Invalid move. Try again: '
    end
  end

  def implement_board(board, row, col)
    puts "\n  #{col.join(' ')}"
    row.each_with_index do |key, index|
      puts key + ' ' + board[index].map { |val| inferface(val, index) }.join('|')
    end
    puts "\n"
  end

  def inferface(val, index)
    return ' ' if val.nil? && index == 2
    return '_' if val.nil?

    val
  end

  def game_won?(board)
    diagonal_win = [
      [board[0][0], board[1][1], board[2][2]],
      [board[0][2], board[1][1], board[2][0]]
    ]
    wins = board + board.transpose + diagonal_win
    wins.each { |try| return true if try.uniq.length == 1 && !try[0].nil? }
    false
  end

  def play
    puts "\nLet's Play Tic-Tac-Toe\n"
    implement_board(board, row_index, col_index)
    counter_increment
  end

  def counter_increment
    REPEATE_COUNT.times do
      break if increment_logic

      @turn = (@turn + NEXT_TURN) % TURN_SWITCHER
    end
  end

  def increment_logic
    make_move(board, row_index, col_index, turn)
    implement_board(board, row_index, col_index)
    if game_won?(board)
      puts "Congratulations. Player #{turn == @@PLAYER_ONE ? 'one' : 'two'} won!"
      true
    end
  end
end

Game.new.play
