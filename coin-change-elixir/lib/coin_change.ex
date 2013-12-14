defmodule CoinChange do
  def change(denomination, amount) do
    denomination |> Enum.reverse |> change!(amount) |> Enum.reverse
  end

  def change!(list, 0) do
    Enum.take([0], Enum.count(list))
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
