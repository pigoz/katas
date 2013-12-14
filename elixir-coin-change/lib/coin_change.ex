defmodule CoinChange do
  import Enum, only: [count: 1, reverse: 1, take: 2]
  import List, only: [duplicate: 2]

  def change(denomination, amount) do
    denomination |> reverse |> change!(amount) |> reverse
  end

  def change!(list, 0) do
    count = count(list)
    take(duplicate(0, count), count)
  end

  def change!([coinvalue|rest], amount) when amount >= coinvalue do
    coins = div(amount, coinvalue)
    total_value = coinvalue * coins
    [coins|change!(rest, amount-total_value)]
  end

  def change!([coinvalue|rest], amount) when amount < coinvalue do
    [0|change!(rest, amount)]
  end
end
