# frozen_string_literal: true

require "buble_sort"

describe BubbleSort do
  let(:arr) { BubbleSort.new([4, 3, 78, 2, 0, 2]) }
  let(:new_arr) { BubbleSort.new([]) }

  context "when input is valid" do
    it "should sort" do
      expect(arr.call).to eq([0, 2, 2, 3, 4, 78])
    end
  end

  context "when array is empty" do
    it "shoud still pass" do
      expect(new_arr.call).to eq([])
    end
  end

  context "must raise an error" do
    let(:str_arr) {BubbleSort.new(["a", 4, 0, 4, 8, 1])}

    it "on string input" do 
      expect(str_arr.call).to be("invalid input")
    end
  end
end
