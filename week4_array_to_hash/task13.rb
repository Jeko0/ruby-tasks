# frozen_string_literal: true

COMPUTER_LANGUAGES = %w[Ruby Python Java .NET HTML Javascript].freeze

class ArrayhashValue
  def call
    count_letters_in_array
  end

  private

  def count_letters_in_array
    COMPUTER_LANGUAGES.each_with_object({}) do |lang, hash|
      hash[lang] = lang.length
    end
  end
end

puts ArrayhashValue.new.call
