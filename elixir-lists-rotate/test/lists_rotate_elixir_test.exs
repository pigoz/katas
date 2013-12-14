defmodule ListsRotateElixirTest do
  use ExUnit.Case

  test "#lrotate, when k=3" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.lrotate(n7, 3) == [:d, :e, :f, :g, :a, :b, :c]
  end

  test "#rrotate, when k=3" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.rrotate(n7, 3) == [:e, :f, :g, :a, :b, :c, :d]
  end

  test "#rrotate, when k=7" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.rrotate(n7, 7) == [:a, :b, :c, :d, :e, :f, :g]
  end

  test "#rrotate, when k=8" do
    n7 = [:a, :b, :c, :d, :e, :f, :g]
    assert ListsRotateElixir.rrotate(n7, 8) == [:g, :a, :b, :c, :d, :e, :f]
  end
end
