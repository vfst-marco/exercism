defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0
  def egg_count(number) when is_integer(number) and number >= 0 do
    shifted = Bitwise.bsr(number, 1)
    cond do
      Bitwise.band(number, 0b1) == 0b1 -> 1 + egg_count(shifted)
      true -> egg_count(shifted)
    end
  end
end
