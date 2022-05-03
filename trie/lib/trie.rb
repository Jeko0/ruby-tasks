# frozen_string_literal: true

class Trie
  def initialize(end_node = false)
    @root = {}
    @end_node = end_node
    @arr = []
  end

  def add(word)
    node = @root

    0.upto(word.length - 1) do |i|
      char = word[i]
      node[char] = {} unless node[char]
      node = node[char]
    end
    node[@end_node] = true
    @arr << word
  end

  def find(word)
    node = @root

    0.upto(word.length - 1) do |i|
      char = word[i]
      return false unless node[char]

      node = node[char]
    end
    node[@end_node] == true
  end

  def include?(prefix)
    node = @root
    prefix.each_char do |letter|
      # tried to remove double nesting but couldn't :)
      if node.include?(letter)
        node = node[letter]
      else
        return false
      end
    end
    true
  end

  def list(prefix)
    container = []
    @arr.each do |word|
      container << word if word.start_with?(prefix)
    end
    container.empty? ? false : container
  end

  def delete(word)
    @arr.delete(word) if find(word)
    puts "#{word} has been deleted"
  end
end

object = Trie.new
object.add('cat')
object.add('cape')
object.add('cow')
object.add('captain')
object.add('bear')
object.add('bunny')
object.add('jeko')

# puts object.list("c")
