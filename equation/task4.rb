# frozen_string_literal: true

MULTIPLIER = 4
DIVISOR = 2

# quadratic equation agorithm
class Quadratic
  def initialize(paramete1, parameter2, parameter3)
    @paramete1 = paramete1
    @parameter2 = parameter2
    @parameter3 = parameter3
    @discriminant = calculate_discriminant
  end

  def calculate_discriminant
    @parameter2 ** 2 - (MULTIPLIER * @paramete1 * @parameter3)
  end

  def when_discriminant_is_positive
    x1 = (-@parameter2 - Math.sqrt(@discriminant)) / DIVISOR * @paramete1
    x2 = (-@parameter2 + Math.sqrt(@discriminant)) / DIVISOR * @paramete1
    puts "Discriminant = #{@discriminant}\n x1 = #{x1}\n x2 = #{x2}\n "
  end

  def when_discriminant_is_zero
    x = -@parameter2 / (DIVISOR * @paramete1)
    puts "Discriminant = #{@discriminant}\n x = #{x}\n"
  end

  def get_elements
    if @discriminant.positive?
      when_discriminant_is_positive
    elsif @discriminant.zero?
      when_discriminant_is_zero
    else
      puts "Discriminant = #{@discriminant}\n No roots"
    end
  end
end

puts 'Enter your numbers'
paramete1 = gets.chomp.to_f
parameter2 = gets.chomp.to_f
parameter3 = gets.chomp.to_f
equation1 = Quadratic.new(paramete1, parameter2, parameter3)
puts equation1.get_elements
