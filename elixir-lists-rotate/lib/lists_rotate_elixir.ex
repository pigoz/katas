defmodule ListsRotateElixir do
  import Enum, [:reverse, 1]

  def lrotate(list, 0), do: list
  def lrotate([head|list], number), do: lrotate(list ++ [head], number - 1)
  def rrotate(list, number), do: list |> reverse |> lrotate(number) |> reverse
end
