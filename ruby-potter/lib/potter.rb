require 'set'

class DPPricer
  def initialize(base_price, discount_percentages)
    @base_price = base_price
    @discount_percentages = discount_percentages
    @sets = []
  end

  def price(entries)
    @sets.clear
    create_pricing_sets(entries)
    sets_price(@sets)
  end

  private
  def create_pricing_sets(entries)
    entries.each do |entry|
      if set_index = optimal_set_for(entry)
        set_o = @sets[set_index]
      else
        set_o = Set.new()
        @sets << set_o
      end
      set_o.add(entry)
    end
  end

  def optimal_set_for(entry)
    @sets.each_with_index.inject([Float::INFINITY, nil]) do |memo, (set, idx)|
      new_set = set.add?(entry)

      if new_set and sets_price(@sets) < memo[0]
        memo = [sets_price(@sets), idx]
      end

      new_set.delete(entry) if new_set

      memo
    end[1]
  end

  def set_price(set)
    set.size * @base_price * @discount_percentages[set.size-1]
  end

  def sets_price(sets)
    sets.inject(0) { |memo, set| memo + set_price(set) }
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
