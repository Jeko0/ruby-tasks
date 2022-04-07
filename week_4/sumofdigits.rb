# frozen_string_literal: true

PART_OF_FORMULA = 2
INCLUDING = 1

class SumofDigits
  def initialize(start_num, end_num, nth_term = 0)
    @start_num = start_num
    @end_num = end_num
    @nth_term = nth_term
  end

  def call
    valid_input
    find_nth_termn
    calculate_given_range
  rescue ArgumentError => e
    warn e
  end

  private

  def valid_input
    return unless @start_num > @end_num

    raise ArgumentError, 'First number should not be greater than the second number'
  end

  def find_nth_termn
    @nth_term = (@end_num - @start_num) + INCLUDING
  end

  def calculate_given_range
    @nth_term / PART_OF_FORMULA * (@start_num + @end_num)
  end
end

# put any input you like
numrange = SumofDigits.new(-22, -10)
puts numrange.call
