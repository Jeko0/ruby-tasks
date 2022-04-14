require "faker"
require "week5_task1"

DIGIT_RANGE = 1..9
NUMBER_RANGE = 1..1_000_000
INVALID_INPUT = "Invalid input"

describe RepDigit do 
  let(:num) { Faker::Number }

  context "should not be valid " do
    it "should return false" do 
      expect(RepDigit.new(num.negative).call).to  eq INVALID_INPUT
    end

    it "should return false" do 
      expect(RepDigit.new(num.decimal).call).to eq INVALID_INPUT
    end

    it "should return false" do 
      expect(RepDigit.new(num.hexadecimal).call).to eq INVALID_INPUT
    end

    it "should return false" do 
      expect(RepDigit.new(num.leading_zero_number).call).to eq INVALID_INPUT
    end
  end

  context "shoud be valid" do

    digit_faker = Faker::Number.within(range: DIGIT_RANGE)
    number_faker = Faker::Number.within(range: NUMBER_RANGE)

    it "shoud retrun true" do 
    expect(RepDigit.new(digit_faker.to_s * number_faker).call).to be_truthy
    end

    it "shoud retrun true" do 
      expect(RepDigit.new(digit_faker.to_s * digit_faker)).to be_truthy
    end 
  end
end