# frozen_string_literal: true

COMPUTER_LANGUAGES = %w[Ruby Python Java .NET HTML JavaScript].freeze

# count number of characters in each array element
class Countcharacters
  def call
    transform_array
  end

  private

  def transform_array
    COMPUTER_LANGUAGES.each_with_object({}) do |language, hash|
      hash[language] = language.length
      hash
    end
  end
end

puts Countcharacters.new.call
