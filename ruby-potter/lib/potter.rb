require 'set'

class DPOptimizer
  def initialize(pricer)
    @pricer = pricer
    @sets = []
  end

  def price(entries)
    refresh_optimized_structure(entries)
    optimized_value
  end

  def optimized_value
    @pricer.prices(@sets)
  end

  private
  def refresh_optimized_structure(entries)
    @sets.clear
    entries.each do |entry|
      find_or_create_optimal_set_for(entry).add(entry)
    end
  end

  def find_or_create_optimal_set_for(entry)
    if set_index = optimal_set_for(entry)
      result = @sets[set_index]
    else
      result = Set.new()
      @sets << result
    end
    result
  end

  def optimal_set_for(entry)
    @sets.each_with_index.inject([Float::INFINITY, nil]) do |memo, (set, idx)|
      new_set = set.add?(entry)

      if new_set and optimized_value < memo[0]
        memo = [optimized_value, idx]
      end

      new_set.delete(entry) if new_set

      memo
    end[1]
  end
end

class Pricer
  def initialize(base_price, discount_percentages)
    @base_price = base_price
    @discount_percentages = discount_percentages
  end

  def price(set)
    set.size * @base_price * @discount_percentages[set.size-1]
  end

  def prices(sets)
    sets.inject(0) { |memo, set| memo + price(set) }
  end
end

class Potter
  def initialize(calculator)
    @calculator = calculator
  end

  def price(*books)
    @calculator.price(books)
  end

end
