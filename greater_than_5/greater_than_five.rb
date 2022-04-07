# frozen_string_literal: true

COMPARING_NUMBER = 5

# find all numbers that are greater than 5 in number array
class GreaterFinder
  class InvalidinputError < StandardError; end

  def initialize(*arr)
    @arr = arr
  end

  def call
    input_validation
    find_desired_numbers
  rescue InvalidinputError => e
    warn e
  end

  private

  def find_desired_numbers
    @arr.select { |number| number > COMPARING_NUMBER }
  end

  def input_validation
    unless @arr.all? do |number|
      number.is_a?(Integer) || number.is_a?(Float)
    end
      raise InvalidinputError, 'Invalid Input'
    end
  end
end

# put any input you like
puts GreaterFinder.new(3, 7, 11, 20, 0, 2, 33).call
