defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    calculate_internal(radicand, 1)
  end

  def calculate_internal(radicant, x) do
    if abs(x*x - radicant) == 0 do
      x
    else
      x_n = 0.5 * (x + radicant / x)
      calculate_internal(radicant, x_n)
    end
  end
end
