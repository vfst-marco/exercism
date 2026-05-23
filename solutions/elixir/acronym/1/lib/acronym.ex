defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.upcase()
    |> String.replace("-", " ")
    |> String.replace(~r/[^\sA-Z]/, "")
    |> String.split(~r/[\s]/, trim: true)
    |> Enum.map(&String.at(&1, 0))
    |> Enum.join()
  end
end
