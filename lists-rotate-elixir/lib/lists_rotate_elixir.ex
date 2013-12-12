defmodule ListsRotateElixir do
  import Enum, [:reverse, 1]

  def lrotate(0, list), do: list
  def lrotate(number, [head|list]), do: lrotate(number - 1, list ++ [head])
  def rrotate(number, list), do: lrotate(number, list |> reverse) |> reverse
end
