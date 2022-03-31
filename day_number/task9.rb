# frozen_string_literal: true

require "date"

class RegularDay
  def initialize(year, month, day)
    @year = year
    @month = month
    @day = day
  end

  def what_day_of_the_year_is_it?
    "Day #{Date.new(@year, @month, @day).strftime("%j")} of the year"
  end
end

# put any input you like
puts RegularDay.new(2022, 4, 22).what_day_of_the_year_is_it?
