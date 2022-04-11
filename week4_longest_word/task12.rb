# frozen_string_literal: true

COMPUTER_LANGUAGES = %w[Ruby Python Java .NET HTML Javascript].freeze

class LongestWordFinder
  def find_longest_word_in_arr
    COMPUTER_LANGUAGES.max_by(&:length)
  end

  def call
    find_longest_word_in_arr
  end
end

puts LongestWordFinder.new.call
