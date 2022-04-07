# frozen_string_literal: true

FACTORIAL_START = 1

class FactorialFinder
  def initialize(num)
    @num = num
  end

  def call
    input_validation
    find_factorial_of_number
  rescue ArgumentError => e
    warn e
  end

  private

  def find_factorial_of_number
    if @num <= FACTORIAL_START
      FACTORIAL_START
    else
      (FACTORIAL_START..@num).inject(:*)
    end
  end

  def input_validation
    raise ArgumentError, "invalid input" unless @num.is_a?(Integer) && (@num.positive? || @num.zero?)
  end
end

puts FactorialFinder.new(10).call

