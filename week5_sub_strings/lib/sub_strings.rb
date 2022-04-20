# frozen_string_literal: true

class SubstringsFinder
  class InvalidinputError < StandardError; end

  def initialize(sentence, dictionary)
    @sentence = sentence
    @dictionary = dictionary
    @substrings = Hash.new(0)
  end

  def call
    check_input
    calculate_sub_strings
  rescue InvalidinputError => e
    e.message
  end

  private

  def loop(userword)
    @dictionary.each do |word|
      @substrings[word] += 1 if userword.downcase.include?(word)
    end
  end

  def calculate_sub_strings
    user_input = @sentence.split(' ')
    user_input.each { |userword| loop(userword) }
    @substrings
  end

  def is_valid?
    @sentence.is_a?(String) && @dictionary.all? { |elemet| elemet.is_a?(String) }
  end

  def check_input
    raise InvalidinputError, 'invalid input' unless is_valid?
  end
end

sentence = "Howdy partner, sit down, how's it going?"
dictionary = %w[below down go going horn how howdy it i low own part partner sit]

puts SubstringsFinder.new(sentence, dictionary).call
