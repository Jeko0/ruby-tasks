# frozen_string_literal: true

class StringMapperService
  class InvalidinputError < StandardError; end

  def initialize(word)
    @word = word
  end

  def call
    input_validation
    string_mapper_hash
  rescue InvalidinputError => e
    warn e
  end

  private

  def input_validation
    raise InvalidinputError, "Input shoud be a word" unless @word.is_a? String
  end

  def string_mapper_hash
    @word.each_char.with_index.with_object({}) { |(c, i), h| (h[c] ||= []) << i }
  end
end

#put any input you like
obj = StringMapperService.new('anano')
puts obj.call
