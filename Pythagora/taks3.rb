# frozen_string_literal: true

# task3
class Pythagora
  def initialize(a, b, c)
    @sides = [a, b, c].sort
  end

  def is_pythagorean?
    @sides[2] ** 2 == @sides[0] ** 2 + @sides[1] ** 2
  end

  def is_isoscele?
    @sides.any? { |side| @sides.count(side) == 2 }
  end

  def is_equilateral?
    @sides.all? { |side| @sides.count(side) == 3 }
  end

  def calculate
    raise ArgumentError, "Sides must be positive" if @sides.any?(&:negative?)
    if is_pythagorean?
      puts 'Triangle is pythagorean'
    elsif is_isoscele?
      puts 'Triangle is isoscele'
    elsif is_equilateral?
      puts 'Triangle is equilateral but not rectangular'
    else 
      puts "Triangle is regular"
    end
  end
end

puts 'please enter triangle side'

a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
triangle = Pythagora.new(a, b, c)
puts triangle.calculate
