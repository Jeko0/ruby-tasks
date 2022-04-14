class RepDigit
  class InvalidinputError < StandardError; end 
  def initialize(number)
    @number = number 
  end 

  def call 
    input_validation 
    is_number_a_repdigit?
  rescue InvalidinputError => e  
     e.message
  end

  private 

  def is_number_a_repdigit? 
    @number.to_s.split('').uniq.length == 1 
  end

  def input_validation
    raise InvalidinputError, "Invalid input" unless @number.is_a? Integer
  end
end

puts RepDigit.new(77777).call