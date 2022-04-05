# frozen_string_literal: true

COMPUTER_LANGUAGES = %w[Ruby Python Java .NET HTML JavaScript].freeze

class ArrayhashValue
  def call
    tranform_array_to_hash
  end

  private

  def tranform_array_to_hash
    COMPUTER_LANGUAGES.each_with_object({}) do |lang, hash|
      hash[lang] = lang.length
      hash
    end
  end
end

puts ArrayhashValue.new.call
