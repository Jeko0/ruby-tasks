# frozen_string_literal: true

class Quadratic
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    riase ArgumentError('Not a quadratic equation') if a.zero?
  end

  def disc
    @b**2 - (4 * @a * @c)
  end

  def display
    if disc.negative?
      puts "Discriminant = #{disc}, but no root"
    elsif disc.zero?
      x = (-@b / 2 / @a)
      puts "Discriminat = #{disc}, root = #{x}"
    elsif disc.positive?
      x1 = (-@b - Math.sqrt(disc)) / (2 * @a)
      x2 = (-@b + Math.sqrt(disc)) / (2 * @a)
      puts "Discriminant = #{disc}, roots = #{x1}, #{x2}"
    end
  end
end
puts 'Enter your numbers'
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
n = Quadratic.new(a, b, c)
puts n.display
