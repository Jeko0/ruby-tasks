# frozen_string_literal: true

class Fibsum
  class InvalidinputError < StandardError; end

  def initialize(number, first_num = 0, second_num = 1)
    @number = number
    @first_num = first_num
    @second_num = second_num
    @result = []
  end

  def call
    input_validation
    fib_even_sum
  rescue InvalidinputError => e
    e.message
  end

  private

  def fib_series
    @result << @first_num
    @number.times do
      @first_num, @second_num = @second_num, @first_num + @second_num
      @result << @first_num
    end
    @result
  end

  def fib_even_sum
    fib_series.select(&:even?).reduce(:+)
  end

  def input_validation
    raise InvalidinputError, 'invalid input' unless @number.is_a?(Integer) && @number.positive?
  end
end

puts Fibsum.new(20).call
