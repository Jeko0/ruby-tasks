# frozen_string_literal: true

HEIGHT_TO_WEIGHT = 110

class CalculateIdealWeight
  class InvalidError < StandardError; end

  def initialize
    puts "Enter your name"
    @name = gets.chomp.to_s
    puts "Enter your height"
    @height = gets.chomp.to_f
  end

  def call
    valid_height?
    user_ideal_weight
    calculate_weight
  rescue InvalidError => e
    warn e
  end

  private

  def valid_height?
    return unless @height.zero? || @height.negative?

    raise InvalidError, "#{@name.capitalize}, you enterd invalid height"
  end

  def user_ideal_weight
    @height - HEIGHT_TO_WEIGHT
  end

  def calculate_weight
    if user_ideal_weight <= 0
      puts "#{@name.capitalize}, your weight is already optimal"
    else
      puts "name: #{@name.capitalize}\nheight: #{@height}\nideal weight: #{user_ideal_weight}"
    end
  end
end

puts CalculateIdealWeight.new.call
