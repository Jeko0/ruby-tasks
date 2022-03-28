# frozen_string_literal: true
# problem5
require 'date'
class Date
  def display
    month_array = Date::MONTHNAMES
    valid = []
    (1...12).each do |month|
      if Date.civil(2022, month, -1).day == 30
        valid << month_array[month]
      else
        puts 'invalid month'
      end
    end
    valid
  end
end

days_of_month = Date.new
puts days_of_month.display
