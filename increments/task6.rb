# frozen_string_literal: true

START_NUM = 10
END_NUM = 100
INCREMENT_BY = 5

class NumInc
  def initialize
    @increments = generate_numbers
  end

  def generate_numbers
    (START_NUM...END_NUM).step(INCREMENT_BY).to_a
  end

  def get_array
    @increments
  end
end

puts NumInc.new.get_array
