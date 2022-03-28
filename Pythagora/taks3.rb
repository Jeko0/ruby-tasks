# frozen_string_literal: true
#task3
class Pythagora
  def initialize(a, b, c)
    @sides = [a, b, c].sort
    raise ArgumentError if @sides.any?(&:negative?)
  end

  def pythagorean?
    @sides[2]**2 == @sides[0]**2 + @sides[1]**2
  end

  def isoscele?
    @sides.any? { |side| @sides.count(side) > 1 }
  end

  def equilateral?
    @sides.all? { |side| @sides.count(side) == 3 }
  end

  def calculate
    if pythagorean?
      puts 'Triangle is pythagorean'
    elsif isoscele?
      puts 'Triangle is isoscele'
    elsif equilateral?
      puts 'Triangle is equilateral'
    end
  end
end

puts 'please enter triangle side'

a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

triangle = Pythagora.new(a, b, c)
puts triangle.calculate
