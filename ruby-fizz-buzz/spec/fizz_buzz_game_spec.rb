require 'helper'

describe FizzBuzz::Game do
  extend IOHelpers

  subject {
    FizzBuzz::Game.new(
      FizzBuzz::EchoFilter.new,
      FizzBuzz::DivisorFilter.new(3, "Fizz"),
      FizzBuzz::DivisorFilter.new(5, "Buzz"),
      FizzBuzz::DivisorFilter.new(7, "Bang"))
  }

  describe "echo flow" do
    define_tests_for([
      [1,1],
      [2,2]
    ])
  end

  describe "fizz flow (multiples of 3 return Fizz)" do
    define_tests_for([
      [3,"Fizz"],
      [3*2,"Fizz"]
    ])
  end

  describe "buzz flow (multiples of 5 return Buzz)" do
    define_tests_for([
      [5,"Buzz"],
      [5*2,"Buzz"]
    ])
  end

  describe "fizz buzz flow (multiples of 3 and 5 return FizzBuzz)" do
    define_tests_for([
      [3*5,"FizzBuzz"]
    ])
  end

  describe "bang flow (multiples of 7 return Bang)" do
    define_tests_for([
      [7,"Bang"],
      [7*2,"Bang"]
    ])
  end

  describe "buzz bang flow (multiples of 5 and 7 return BuzzBang)" do
    define_tests_for([
      [5*7,"BuzzBang"]
    ])
  end

  describe "fizz bang flow (multiples of 3 and 7 return FizzBang)" do
    define_tests_for([
      [3*7,"FizzBang"]
    ])
  end 

  describe "fizz buzz bang flow (multiples of 3, 5 and 7 return BuzzBang)" do
    define_tests_for([
      [3*5*7,"FizzBuzzBang"]
    ])
  end

end
