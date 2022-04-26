module Enumerable
  def my_each_with_index 
    index = 0 
    for i in self 
      yield i, index 
      index += 1 
    end
  end

  def my_map(my_lambda = nil)
    arr = []
    my_each{|i| arr << (my_lambda ? my_lambda.call(i) : (yield i))}
    arr
  end

  def my_select 
    arr = []
    for i in self 
      if yield i   
        arr << i   
      end
    end
    arr
  end

  def my_all? 
    my_each{|i| return false unless yield i}
    true 
  end

  def my_none? 
    my_each{|i| return false if yield i}
    true 
  end

  def my_any? 
    my_each{|i| return true if yield i}
    false 
  end

  def my_count
    counter = 0
    if block_given? 
      my_each { |i| counter += 1 if yield i }
      counter
    else 
      count = size 
    end
  end

  def my_inject(base_value)
    result = base_value 
    my_each{|i| result = (yield result, i)}
    result
  end
end

class Array
  def my_each
    for i in self 
      yield i   
    end
  end
end