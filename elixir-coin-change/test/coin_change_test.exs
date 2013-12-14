defmodule CoinChangeTest do
  use ExUnit.Case

  test "returns [11] with D=[1] C=11" do
    assert CoinChange.change([1], 11) == [11]
  end

  test "returns [0,2] with D=[1,2] C=4" do
    assert CoinChange.change([1,2], 4) == [0,2]
  end

  test "returns [1,1] with D=[1,2] C=3" do
    assert CoinChange.change([1,2], 3) == [1,1]
  end

  test "returns [1,1,1,1,1] with D=[1,5,10,25,100] C=141" do
    assert CoinChange.change([1,5,10,25,100], 141) == [1,1,1,1,1]
  end

  test "returns [1,0,1,0,0] with D=[1,5,10,25,100] C=11" do
    assert CoinChange.change([1,5,10,25,100], 11) == [1,0,1,0,0]
  end
end
