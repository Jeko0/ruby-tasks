# frozen_string_literal: true

# solution for task1
CONVERT_TO_WEIGHT = 110

class Weight
  def initialize(user, height)
    @user = user
    @height = height
  end

  # calculating whether persons weight is optimal or not
  def calculate_weight
    if (@height - CONVERT_TO_WEIGHT).negative?
      puts "Your weight is already opimal"
    else
      puts "Your name is #{@user}, height #{@height} and your optimal weight should be #{@height - CONVERT_TO_WEIGHT}"
    end
  end
end

puts 'please Enter you name and height'
user = gets.chomp.to_s
height = gets.chomp.to_f
person = Weight.new(user, height)
puts person.calculate_weight
