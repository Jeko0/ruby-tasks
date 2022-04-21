# frozen_string_literal: true

REPEATE_COUNT = 9
TURN_SWITCHER = 2
NEXT_TURN = 1

class Game
  @@PLAYER_ONE = 0
  @@PLAYER_TWO = 1

  def initialize; end

  def call
    play
  end

  private

  def make_move(board, row, col, turn)
    print turn == @@PLAYER_ONE ? "First player's turn: " : "Second player's turn: "
    loop do
      move = gets.chomp.upcase.chars.sort
      if board[row.index(move[0])][col.index(move[1])].nil?
        board[row.index(move[0])][col.index(move[1])] = (turn == @@PLAYER_ONE ? 'X' : 'O')
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

  def game_won?(board, _turn)
    row_win = board
    col_win = board.transpose
    diagonal_win = [[board[0][0], board[1][1], board[2][2]], [board[0][2], board[1][1], board[2][0]]]
    wins = row_win + col_win + diagonal_win

    wins.each { |try| return true if try.uniq.length == 1 && !try[0].nil? }
    false
  end

  def play
    row_index = %w[A B C]
    col_index = %w[D E F]
    board = Array.new(3) { Array.new(3) }
    turn = @@PLAYER_ONE

    puts "\nLet's Play Tic-Tac-Toe\n"
    implement_board(board, row_index, col_index)

    REPEATE_COUNT.times do
      make_move(board, row_index, col_index, turn)
      implement_board(board, row_index, col_index)
      if game_won?(board, turn)
        puts "Congratulations. Player #{turn == @@PLAYER_ONE ? 'one' : 'two'} won!"
        return
      end
      turn = (turn + NEXT_TURN) % TURN_SWITCHER
    end

    puts "It's a tie!"
  end
end

Game.new.call
