require "missing_number"
require "faker"

INVALID_INPUT = "invalid input"

describe "NumberFinde" do
  let(:num) { Faker::Number }
  let(:fake_char) { Faker::Alphanumeric.alphanumeric(number: 10) }

  context "when given value contains letters and decimals" do
    it "should return error on letters" do 
      expect(NumberFinder.new(fake_char.split('')).call).to  eq INVALID_INPUT
    end

    it "should return error on decimals" do 
      expect(NumberFinder.new(num.decimal).call).to  eq INVALID_INPUT
    end
  end

  context "when given array is empty" do
    it "should return error when array is empty" do 
    expect(NumberFinder.new([]).call).to eq INVALID_INPUT  
    end
  end
end
