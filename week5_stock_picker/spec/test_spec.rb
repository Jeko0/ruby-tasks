# frozen_string_literal: true

require "stock_picker"

ERROR_MESSAGE = "invalid input"

describe "StockPicker" do
  context "when given input is valid" do
    it "should return correct answer" do
      input = [17, 3, 6, 9, 15, 8, 6, 1, 10]
      answer = [1, 4]
      expect(StockPicker.new(input).call).to eq answer
    end

    it "should return correct answer" do
      input = [1, 3, 6, 9, 2, 8, 6, 1, 10]
      answer = [0, 8]
      expect(StockPicker.new(input).call).to eq answer
    end

    it "should return correct answer" do
      input = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
      answer = [0, 0]
      expect(StockPicker.new(input).call).to eq answer
    end

    it "should return correct answer" do
      input = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1].reverse
      answer = [0, 9]
      expect(StockPicker.new(input).call).to eq answer
    end

    it "should return correct answer" do
      input = [17, 3, 6, 9, 15, 8, 6, 1, 10].reverse
      answer = [1, 8]
      expect(StockPicker.new(input).call).to eq answer
    end
  end

  context "when given input is invalid" do
    it "catch error when input array contain string" do
      input = [10, 9, 8, 7, 6, 5, 4, 3, 2, "1"]
      expect(StockPicker.new(input).call).to eq ERROR_MESSAGE
    end

    it "should raise an error when input contains negative number" do
      input = [10, 9, 8, 7, 6, 5, 4, -3, 2, 1]
      expect(StockPicker.new(input).call).to eq ERROR_MESSAGE
    end
  end
end
