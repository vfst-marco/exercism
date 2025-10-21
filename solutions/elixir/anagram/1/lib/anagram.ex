
defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    sorted_base_letters = normalize(base)
    candidates |> Enum.filter(fn word -> word |> String.downcase() != base |> String.downcase() && sorted_base_letters == normalize(word) end)
  end

  defp normalize(word) do
    word |> String.downcase() |> String.graphemes() |> Enum.sort()
  end
end
