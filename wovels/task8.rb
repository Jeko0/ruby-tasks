# frozen_string_literal: true

CHARACTER_BYTES = 96
VOWELS = 'aeiou'

#solution for converting wovels into it's position number in the alphabet
class VowelIndex
  def initialize
    @vowels_hash = Hash.new
  end

  def fill
    VOWELS.each_char do |vowel|
      @vowels_hash[vowel] = vowel.bytes.join.to_i - CHARACTER_BYTES
    end
  end

  def display_vowels_hash
    @vowels_hash
  end
end

vowels = VowelIndex.new
vowels.fill
puts vowels.display_vowels_hash
