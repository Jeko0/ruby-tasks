require "caesar"


describe Caesar do
  context "when key is positive" do
    it "should work on small positive key" do 
      expect(Caesar.new("What a string!", 5).call).to eq("Bmfy f xywnsl!") 
    end

    it "should work on large positive key" do 
      expect(Caesar.new("What a string!", 60).call).to  eq("Epib i abzqvo!")
    end
  end

  context "when key is negative" do
    it "should work on negative key" do 
      expect(Caesar.new("What a string!", -5).call).to eq("Rcvo v nomdib!")
    end

    it "should work on large negative key" do 
      expect(Caesar.new("What a string!", -90).call).to eq("Kvoh o ghfwbu!")
    end
  end

  context "when key is not an integer" do
    it "should raise an error" do 
      expect(Caesar.new("What a string!", "a").call).to eq("Invalid input")
    end

    it "shoud raise an error on float number" do 
      expect(Caesar.new("What a string!", 2.58).call).to eq("Invalid input")
    end
  end
end
