# frozen_string_literal: true

class DuplicateFinder
  def initialize(*arr)
    @arr = arr
  end

  def call
    input_validation
    display_duplicates
  rescue ArgumentError => e
    warn e
  end

  private

  def display_duplicates
    @arr.select { |element| @arr.count(element) > 1 }.uniq
  end

  def input_validation
    unless @arr.all? do |element|
      element.is_a? Integer
    end
      raise ArgumentError, "invalid input"
    end
  end
end

puts DuplicateFinder.new(2, 3, 3, 4, 5, 5, 6).call
