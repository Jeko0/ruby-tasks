# frozen_string_literal: true

require 'prime'

class PrimeFinder
  def initialize(*arr)
    @arr = arr
  end

  def call
    check_valid_input
    find_prime_numbers
  rescue ArgumentError => e
    warn e
  end

  private

  def find_prime_numbers
    @arr.count(&:prime?)
  end

  def check_valid_input
    unless @arr.all? do |num|
      num.is_a?(Integer)
    end
      raise ArgumentError, 'input shoud be numbers'
    end
  end
end

# put any input you like
puts PrimeFinder.new(10, 11, 5, 23, 1, 2).call

# with recursion

class PrimeFinder
  class InvalidinputError < StandardError; end

  def initialize(*arr)
    @arr = arr
  end

  def call
    input_validation
    count_prime_numbers
  rescue InvalidinputError => e
    warn e
  end

  private

  def count_prime_numbers
    @arr.count do |item|
      is_prime_number(item, item - 1)
    end
  end

  def is_prime_number(item, number)
    return false if item == 1
    return true if number == 1
    return is_prime_number(item, number - 1) if item % number != 0
  end

  def input_validation
    unless @arr.all? do |element|
      element.is_a? Integer
    end
      raise InvalidinputError, 'Invalid Input'
    end
  end
end

puts PrimeFinder.new(1, 2, 3, 4, 5, 6, 7, 8, 9).call
