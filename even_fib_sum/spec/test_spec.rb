# frozen_string_literal: true

require "fibsum"
require "faker"

INVALID_INPUT = "invalid input"

describe "Fibsum" do
  let(:num) { Faker::Number }

  context "shoud not be valid" do
    it "shoud return error" do
      expect(Fibsum.new(num.negative).call).to eq INVALID_INPUT
    end

    it "shoud return error" do
      expect(Fibsum.new(num.decimal).call).to eq INVALID_INPUT
    end
  end

  context "should be valid" do
    it "should return true" do
      expect(Fibsum.new(num.positive)).to be_truthy
    end

    it "should return true" do
      expect(Fibsum.new(num.digit)).to be_truthy
    end
  end
end
