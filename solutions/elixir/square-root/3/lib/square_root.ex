defmodule SquareRoot do
@moduledoc """
Utility to calculate the square root.
"""

  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    do_calculate(radicand, 1)
  end

  @doc false
  defp do_calculate(radicant, x) when radicant == x * x, do: x
  defp do_calculate(radicant, x) do
    x_n = 0.5 * (x + radicant / x)
    do_calculate(radicant, x_n)
  end
end
