require 'rspec'
require 'fizz_buzz'

module IOHelpers
  def define_tests_for(ary)
    ary.each do |io|
      it "returns #{io[0]} with input #{io[1]}" do
        subject.compute(io[0]).should == io[1]
      end
    end
  end
end
