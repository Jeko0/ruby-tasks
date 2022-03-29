require "date"

class RegularDay
  def initialize(year, month, day)
    @year = year 
    @month = month
    @day = day 
  end

  def date_to_number 
    "Day #{Date.new(@year, @month, @day).yday} of the year"
  end
end

# put any input you like
puts RegularDay.new(2022, 3, 12).date_to_number