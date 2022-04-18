# frozen_string_literal: true

class BubbleSort
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def call
    input_validation
    implement_buble_sort
  rescue ArgumentError => e
    e.message
  end

  private

  def implement_buble_sort
    size = @arr.length

    loop do
      sorted = false

      (size - 1).times do |i|
        if @arr[i] > @arr[i + 1]
          @arr[i], @arr[i + 1] = @arr[i + 1], @arr[i]
          sorted = true
        end
      end
      break unless sorted
    end
    @arr
  end

  def input_validation
    raise ArgumentError, "invalid input" unless @arr.is_a?(Array) && @arr.all? { |element| element.is_a?(Numeric) }
  end
end

 puts BubbleSort.new([4, 3, 78, 2, 0, 2]).call
