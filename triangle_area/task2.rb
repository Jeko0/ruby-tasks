# frozen_string_literal: true

PART_OF_FORMULA = 0.5

# solution for triangle area
class Triangle
  def initialize(base, height)
    @a = base.to_f
    @h = height.to_f
  end

  def area_of_triangle
    @a * @h * PART_OF_FORMULA
  end
end

puts 'Enter Triangles base and height'
base = gets.chomp
height = gets.chomp
triangle1 = Triangle.new(base, height)
puts triangle1.area_of_triangle
