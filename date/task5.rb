# frozen_string_literal: true

require 'date'
NEEDED_PARAMETER = -1

class Dote
  def initialize(year)
    @year = year
    @months_with_days = count_month_days
  end

  def count_month_days
    months_with_days = {}
    (1..12).each do |value|
      months_with_days[Date::MONTHNAMES[value].to_s] = Date.new(@year, value, NEEDED_PARAMETER).day
    end
    months_with_days
  end

  def get_months_with_desired_days(days)
    @months_with_days.select { |_name_of_month, days_in_month| days_in_month == days }
  end
end

puts Dote.new(2022).get_months_with_desired_days(30)
