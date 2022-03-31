# frozen_string_literal: true

COUNT_FIBONACCI = 100

# solution for fibonacci series
class Fibonaci
  def initialize
    @first_number = 0
    @second_number = 1
    @numbers = num_array
  end

  def num_array
    numbers = []
    numbers << @first_number

    COUNT_FIBONACCI.times do
      @first_number, @second_number = @second_number, @first_number + @second_number
      numbers << @first_number
    end
    
    numbers
  end

  def get_numbers
    @numbers
  end
end

fib = Fibonaci.new

puts fib.get_numbers
