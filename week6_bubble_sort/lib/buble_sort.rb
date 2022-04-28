class BubbleSort
  attr_reader :arr

  def initialize(arr, sorted = false)
    @arr = arr
    @sorted = sorted
    @size = @arr.length
  end

  def call
    input_validation
    implement_bubble_sort
  rescue ArgumentError => e
    e.message
  end

  private

  def implement_bubble_sort
    (0...@size).each do
      logic
    end
    arr
  end

  def logic
    (1..@size - 1).each do |idx|
      next unless arr[idx - 1] > arr[idx]

      arr[idx - 1], arr[idx] = arr[idx], arr[idx - 1]
    end
  end

  def is_valid?
    @arr.is_a?(Array) && @arr.all? { |element| element.is_a?(Numeric) }
  end

  def input_validation
    raise ArgumentError, "invalid input" unless is_valid?
  end
end

puts BubbleSort.new([4, 3, 78, 2, 0, 2]).call
