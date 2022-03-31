# frozen_string_literal: true

PART_OF_FORMULA = 2

# task3
class Pythagora
  def initialize(a, b, c)
    @sides = [a, b, c].sort
  end

  def is_triangle?
    @sides.max < @sides.inject(:+) / PART_OF_FORMULA
  end

  def is_pythagorean?
    @sides[2]**2 == @sides[0]**2 + @sides[1]**2
  end

  def is_isoscele?
    @sides.any? { |side| @sides.count(side) == 2 }
  end

  def is_equilateral?
    @sides.all? { |side| @sides.count(side) == 3 }
  end

  def what_kind_of_triangle_is_it?
    raise ArgumentError, 'Sides must be positive' if @sides.any?(&:negative?)

    if is_triangle? && is_pythagorean?
      puts 'Triangle is pythagorean'
    elsif is_triangle? && is_isoscele?
      puts 'Triangle is isoscele'
    elsif is_equilateral?
      puts 'Triangle is equilateral but not rectangular'
    else
      puts 'invalid triangle sides'
    end
  end
end

puts 'please enter triangle side'

a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
triangle = Pythagora.new(a, b, c)
puts triangle.what_kind_of_triangle_is_it?
