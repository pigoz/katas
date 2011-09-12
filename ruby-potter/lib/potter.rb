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
    unless result = optimal_set_for(entry)
      result = Set.new()
      @sets << result
    end
    result
  end

  def optimal_set_for(entry)
    @sets.inject([Float::INFINITY, nil]) do |memo, set|
      if set = set.add?(entry)
        memo = [optimized_value, set] if optimized_value < memo[0]
        set.delete(entry)
      end

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
