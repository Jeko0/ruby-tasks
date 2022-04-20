# frozen_string_literal: true

MY_ARRAY = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
MAX_LENGHT = 9

class NumberFinder
  class InvalidinputError < StandardError; end

  def initialize(arr)
    @arr = arr
  end

  def call
    input_validation
    find_missing_number
  rescue InvalidinputError => e
     e.message
  end

  private

  def find_missing_number
    MY_ARRAY - @arr
  end

  def check 
    (@arr.is_a? (Array)) && @arr.size == MAX_LENGHT && @arr.all?{|el| el.is_a? Integer}
  end

  def input_validation
   raise InvalidinputError, "invalid input" unless check
  end
end

# puts NumberFinder.new([3, 1, 6, 2, 5, 9, 8, 4, 10]).call
