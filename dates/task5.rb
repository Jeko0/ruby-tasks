# frozen_string_literal: true

# problem5
require 'date'
class Date
  def display
    month_array = Date::MONTHNAMES
    valid = []
    (1...12).each do |month|
      Date.civil(2022, month, -1).day == 30 ? valid << month_array[month] : false
    end
    valid
  end
end

object = Date.new
puts object.display
