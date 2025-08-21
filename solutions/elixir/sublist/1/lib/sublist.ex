defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      contains(a, b, length(a)) -> :sublist
      contains(b, a, length(b)) -> :superlist
      true -> :unequal
    end
  end

  defp contains(_a, b, len) when len > length(b), do: false
  defp contains(a, b, len) do
    candidate = Enum.take(b, len)
    if a === candidate do
      true
    else
      contains(a, tl(b), len)
    end
  end
end
