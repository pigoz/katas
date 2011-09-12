require 'helper'

describe Potter do

  subject {
    Potter.new(
      DPOptimizer.new(
        Pricer.new(8.0, [1.0, 0.95, 0.90, 0.80, 0.75])
      )
    )
  }

  describe "basics" do
    it "returns 0 when no books are provided" do
      subject.price().should == 0
    end

    it "returns 8 when one books is provided" do
      subject.price(1).should == 8
      subject.price(2).should == 8
      subject.price(3).should == 8
      subject.price(4).should == 8
      subject.price(5).should == 8
    end

    it "return price*3 with with n same books" do
      subject.price(1,1).should == 8*2
      subject.price(2,2,2).should == 8*3
    end
  end

  describe "discount rules" do
    it "applies discount on 2 items" do
      subject.price(1,2).should == 8*2*0.95
      subject.price(1,2,3).should == 8*3*0.90
      subject.price(1,2,3,4).should == 8*4*0.80
      subject.price(1,2,3,4,5).should == 8*5*0.75
    end

    it "applies discount on 2 items and not other" do
      subject.price(1,1,2).should == 8 + (8 * 2 * 0.95)
    end

    it "applies discount on 2 groups of 2 items" do
      subject.price(1,1,2,2).should == 2 * (8 * 2 * 0.95)
    end

    it "applies discount on 2 groups of 4-2 items" do
      subject.price(1,1,2,3,3,4).should == (8 * 4 * 0.8) + (8 * 2 * 0.95)
    end

    it "applies discount on 2 groups of 4-2 items" do
      subject.price(1,2,2,3,4,5).should == 8 + (8 * 5 * 0.75)
    end
  end

  describe "edge cases" do
    it "complex" do
      subject.price(1,1,2,2,3,3,4,5).should == 2 * (8 * 4 * 0.8)
    end

    it "ludicrouos" do
      subject.price(1,1,1,1,1,
                    2,2,2,2,2,
                    3,3,3,3,
                    4,4,4,4,4,
                    5,5,5,5).should == 3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8)
    end
  end

end
