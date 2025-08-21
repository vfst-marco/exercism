defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0
  def egg_count(number) when is_integer(number) and number >= 0, do:
    Bitwise.&&&(number, 0b1) + egg_count(Bitwise.>>>(number, 1))
end
