require_relative 'csv_write'

class TrieNode
  attr_accessor :is_end, :children

  def initialize(is_end = false)
    @is_end = is_end
    @children = Array.new(26)
  end
end

class Trie
  attr_accessor :root, :dictionary

  def initialize
    @root = TrieNode.new
    @dictionay = []
    @csv_dictionary = Csv.new
    @test = []
  end

  def add(word)
    @dictionay << word
    @test << word
    word_chars = word.chars
    current = @root
    0.upto(word.length - 1) do |i|
      letter = word_chars[i].ord - 'a'.ord
      current.children[letter] = TrieNode.new if current.children[letter].nil?
      current = current.children[letter]
    end
    current.is_end = true
  end

  def find(word)
    word_chars = word.chars
    current = @root
    (0..word.length - 1).each do |i|
      letter = word_chars[i].ord - 'a'.ord
      return false if current.children[letter].nil?

      current = current.children[letter]
    end
    current.is_end
  end

  def list(prefix)
    result = []
    @dictionay.each { |word| result << word if word.start_with?(prefix) }
    result.length.zero? ? 'word is not in dictionary' : result
  end

  def include?(word)
    find(word) { |found, root| return found && root.word }
  end

  def delete_word(word)
    @dictionay.delete(word)
    delete_recursively(word, 0, root)
  end

  def write_csv
    @csv_dictionary.save_to_csv(@test)
  end

  def read_csv
    @csv_dictionary.read_from_csv
  end

  private

  def is_in_trie?(word, index, current)
    if index == word.length
      return false unless current.is_end

      current.is_end = false
      current.children.length.zero?
    end
  end

  def delete_each(current, char, should_delete_ref)
    if should_delete_ref
      current.children.delete(char)
      current.children.length.zero?
    end
  end

  def delete_recursively(word, index, root)
    current = root

    is_in_trie?(word, index, current)

    char = word[index]
    return false unless current.children.include?(char)

    next_node = current.children[char]
    should_delete_ref = delete_recursively(word, index + 1, next_node)

    delete_each(current, char, should_delete_ref)
    false
  end
end

trie = Trie.new
trie.add('cat')
trie.add('camp')
trie.add('cave')
trie.add('cask')
trie.add('cow')
trie.add('apple')
trie.add('tester')
puts trie.read_csv
# puts trie.list('')
