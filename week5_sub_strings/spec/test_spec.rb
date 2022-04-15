# frozen_string_literal: true

require "sub_strings"
require "faker"

ERROR_MESSAGE = "invalid input"

describe "SubstringsFinder" do
  let(:dictionary) { %w[below down go going horn how howdy it i low own part partner sit] }

  context "runs the program when value is acceptabel" do
    output = { "below" => 1, "low" => 1 }
    answer = {
      "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2,
      "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1
    }

    it "should check for the word if it's in the dictionary" do
      expect(SubstringsFinder.new("below", dictionary).call).to eq output
    end

    it "should check whether dictionary contains words that are in sentence" do
      expect(SubstringsFinder.new("Howdy partner, sit down, how's it going?", dictionary).call).to eq answer
    end

    it "should run when given string is empty" do
      output = {}
      input = ""
      expect(SubstringsFinder.new(input, dictionary).call).to eq output
    end
  end

  context "raises error when input is invalid" do
    it "should print error if input contains numbers " do
      input = 2
      expect(SubstringsFinder.new(input, dictionary).call).to eq ERROR_MESSAGE
    end
  end

  context "when given strin doesnt contain words from dictionary" do
    input = "s"
    output = {}
    it "should check the words if it's in dictionary" do
      expect(SubstringsFinder.new(input, dictionary).call).to eq output
    end
  end
end
