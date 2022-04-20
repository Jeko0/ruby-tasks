# frozen_string_literal: true

require_relative 'validations'

class Interface
  def initialize
    @validations = Validations.new
    @errors = Errors.new
  end

  def show(board)
    puts ''
    puts " #{board.state[1]} | #{board.state[2]} | #{board.state[3]} "
    puts '---|---|---'
    puts " #{board.state[4]} | #{board.state[5]} | #{board.state[6]} "
    puts '---|---|---'
    puts " #{board.state[7]} | #{board.state[8]} | #{board.state[9]} "
  end

  def ask_input(board, symbol)
    valid_position = nil
    until valid_position
      show(board)
      puts "#{symbol}'s turn..."
      position = gets.chomp.to_i
      valid_position = @validations.valid_position(board, position)
    end
    position
  end

  def welcome
    puts 'Welcome to Tic Tac Toe'
  end

  def victory(board, winner)
    show(board)
    puts "\nPlayer #{winner} wins"
    puts "\nThe game ends"
    winner
  end

  def stalemate(board)
    show(board)
    puts "\nIt's a stalemate"
    puts "\nThe game ends"
    0
  end
end
