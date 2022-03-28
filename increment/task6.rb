# frozen_string_literal: true

# solution for task 6
class Increments
  def count
    result = []
    (10...100).each do |number|
      result << number if (number % 5).zero?
    end
    result
  end
end

object = Increments.new
puts object.count
