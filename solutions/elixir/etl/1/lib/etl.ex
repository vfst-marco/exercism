defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    input
    |> Enum.map(fn {points, chars} ->
      Map.new(chars, fn ch -> {String.downcase(ch), points} end)
    end)
    |> Enum.reduce(&Map.merge/2)
  end
end
