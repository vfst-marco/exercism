defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
  def kind(a, a, a), do: {:ok, :equilateral}
  def kind(a, b, c) when a + b > c and b + c > a and a + c > b do
    cond do
      a == b -> {:ok, :isosceles}
      a == c -> {:ok, :isosceles}
      b == c -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end
  def kind(_a, _b, _c), do: {:error, "side lengths violate triangle inequality"}
end
