module FizzBuzz
  class Game

    def initialize(*filters)
      @catch_all, *@filters = filters
    end

    def compute(input)
      result = @filters.inject(nil) do |memo, filter|
        if filter.handles?(input)
          "#{memo}#{filter.compute(input)}"
        else
          memo
        end
      end

      result.nil? ? @catch_all.compute(input) : result
    end

  end
end
