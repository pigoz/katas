defmodule ListsRotateElixirTest do
  use ExUnit.Case

  test "#lrotate, when k=3" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.lrotate(3, n7) == [:d, :e, :f, :g, :a, :b, :c]
  end

  test "#rrotate, when k=3" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.rrotate(3, n7) == [:e, :f, :g, :a, :b, :c, :d]
  end

  test "#rrotate, when k=7" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.rrotate(7, n7) == [:a, :b, :c, :d, :e, :f, :g]
  end

  test "#rrotate, when k=8" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.rrotate(8, n7) == [:g, :a, :b, :c, :d, :e, :f]
  end
end
