defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    for top <- tops, bottom <- bottoms, filter(top, bottom, options) do
      {top, bottom}
    end
  end

  defp filter(top, bottom, options) do
    filter_clashing_colors(top, bottom) &&
    filter_maxprice(top.price + bottom.price, Keyword.get(options, :maximum_price, 100))
  end

  defp filter_clashing_colors(top, bottom), do: top.base_color != bottom.base_color

  defp filter_maxprice(actual_price, maximum_price), do: actual_price <= maximum_price

end
