# frozen_string_literal: true
class Weight 
  puts 'Please enter your name'
  user = gets.chomp.to_s
    
  puts 'Please enter your height'
  height = gets.chomp.to_f
    
  if (height - 110).negative?
    puts 'Your weight is already opimal'
  else
    puts "Your name is #{user}, height #{height} and your optimal weight should be #{height - 110}"
  end
end