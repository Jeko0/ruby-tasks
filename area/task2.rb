# frozen_string_literal: true
# solution for triangle area
class Triangle
  FORMULA_1 = 1
  FORMULA_2 = 2
  def initialize(base, height)
    @a = base.to_f
    @h = height.to_f
  end

  def area_of_triangle
    @a * @h * FORMULA_1 / FORMULA_2
  end
end

puts 'Enter Triangles base and height'
base = gets.chomp
height = gets.chomp
triangle1 = Triangle.new(base, height)
puts triangle_1.area_of_triangle
