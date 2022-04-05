# frozen_string_literal: true

COMPUTER_LANGUAGES = %w[Ruby Python Java .NET HTML Javascript].freeze

class LongestWordFinder
  class EmptyarrayError < StandardError; end

  def find_longest_word_in_array
    COMPUTER_LANGUAGES.max_by(&:length)
  end

  def call
    something_wrong?
    display_longest_word
  rescue EmptyarrayError => e
    warn e
  end

  private

  def something_wrong?
    return unless COMPUTER_LANGUAGES.empty?

    raise EmptyarrayError, 'Looks like an array is empty'
  end

  def display_longest_word
    find_longest_word_in_array
  end
end

puts LongestWordFinder.new.call
