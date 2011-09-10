module FizzBuzz

  class EchoFilter
    def compute(input)
      input
    end
  end

  class DivisorFilter
    def initialize(divisor, answer)
      @divisor = divisor
      @answer = answer
    end

    def compute(input)
      @answer
    end

    def handles?(input)
      input % @divisor == 0
    end
  end
end
