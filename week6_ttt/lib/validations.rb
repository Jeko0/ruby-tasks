# frozen_string_literal: true

require_relative 'errors'

class Validations
  def initialize
    @errors = Errors.new
  end

  def symbol(symbol)
    return -2 if symbol != 'x' && symbol != 'o'
  end

  def inputed_position(inputed)
    return 21 if inputed > 9
    return 22 if inputed < 1
  end

  def free_position(actual)
    return 33 if %w[x o].include?(actual)
  end

  def valid_position(board, inputed)
    error1 = inputed_position(inputed)
    if error1
      @errors.handling(error1)
    else
      error2 = free_position(board.state[inputed])
      if error2
        @errors.handling(error2)
      else
        valid_position = true
      end
    end
  end
end
