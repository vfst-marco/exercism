defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) when is_integer(number) and number >= 0 do
    cond do
      number == 0 -> 0
      Bitwise.band(number, 0b1) == 0b1 -> 1 + egg_count(Bitwise.bsr(number, 1))
      true -> egg_count(Bitwise.bsr(number, 1))
    end
  end
end
