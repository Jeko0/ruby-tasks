# frozen_string_literal: true

PART_OF_FORMULA = 0.5

# solution for triangle area
class Triangle
  def initialize(base, height)
    @base = base
    @height = height
  end

  def area_of_triangle
    @base * @height * PART_OF_FORMULA
  end
end

puts 'Enter Triangles base and height'
base = gets.chomp.to_f
height = gets.chomp.to_f
triangle1 = Triangle.new(base, height)
puts triangle1.area_of_triangle
