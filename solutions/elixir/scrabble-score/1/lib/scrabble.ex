defmodule Scrabble do
  @score_map Map.new(~w(A E I O U L N R S T), fn x -> {x, 1} end)
             |> Map.merge(Map.new(~w(D G), fn x -> {x, 2} end))
             |> Map.merge(Map.new(~w(B C M P), fn x -> {x, 3} end))
             |> Map.merge(Map.new(~w(F H V W Y), fn x -> {x, 4} end))
             |> Map.merge(Map.new(~w(K), fn x -> {x, 5} end))
             |> Map.merge(Map.new(~w(J X), fn x -> {x, 8} end))
             |> Map.merge(Map.new(~w(Q Z), fn x -> {x, 10} end))

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.sum_by(fn x -> @score_map[x] || 0 end)
  end
end
