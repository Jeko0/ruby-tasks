class TrieNode
  attr_accessor :prefix_count, :is_end, :children

  def initialize(prefix_count = 0, is_end = false)
    @prefix_count = prefix_count
    @is_end = is_end
    @children = Array.new(26)
  end
end

class Trie
  attr_accessor :head

  def initialize
    @head = TrieNode.new
  end

  def add(word)
    word_chars = word.chars
    current = @head
    current.prefix_count += 1
    (0..word.length - 1).each do |i|
      letter = word_chars[i].ord - 'a'.ord
      current.children[letter] = TrieNode.new if current.children[letter].nil?
      current.children[letter].prefix_count += 1
      current = current.children[letter]
    end
    current.is_end = true
  end

  def find(word)
    word_chars = word.chars
    current = @head
    (0..word.length - 1).each do |i|
      letter = word_chars[i].ord - 'a'.ord
      return false if current.children[letter].nil?

      current = current.children[letter]
    end
    current.is_end
  end

  def list(prefix)
    prefix_chars = prefix.chars
    current = @head
    (0..prefix.length - 1).each do |i|
      letter = prefix_chars[i].ord - 'a'.ord
      return 0 if current.children[letter].nil?

      current = current.children[letter]
    end
    current.prefix_count
  end
end

trie = Trie.new
trie.add('cat')
trie.add('cape')
trie.add('cow')
trie.add('camp')
trie.add('cave')

p trie.list('cat')
