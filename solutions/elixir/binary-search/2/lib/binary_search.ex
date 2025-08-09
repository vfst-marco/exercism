defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) when is_tuple(numbers) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  @spec search(tuple, integer, non_neg_integer(), integer) :: {:ok, integer} | :not_found
  defp search(_numbers, _key, lower, upper) when lower > upper, do: :not_found
  defp search(numbers, key, lower, upper) do
    pivot_pos = div(lower + upper, 2)
    pivot = elem(numbers, pivot_pos)
    cond do
      pivot == key -> {:ok, pivot_pos}
      pivot < key ->
        search(numbers, key, pivot_pos + 1, upper)
      true ->
        search(numbers, key, lower, pivot_pos - 1)
    end
  end
end
