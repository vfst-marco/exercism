defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(r1 :: rational, r2 :: rational) :: rational
  def add(r1, r2) do
    {a1, b1} = r1
    {a2, b2} = r2
    reduce({a1*b2 + a2*b1, b1*b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(r1 :: rational, r2 :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) do
    reduce({a1*b2 - a2*b1, b1*b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(r1 :: rational, r2 :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    {a, b} = reduce({a1*a2, b1*b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
    reduce({a1*b2, a2*b1})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    reduce({Kernel.abs(a), Kernel.abs(b)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a, b}, n) when n > 0 do
    reduce({Integer.pow(a, n), Integer.pow(b,n)})
  end

  def pow_rational({a, b}, n) do
    m = Kernel.abs(n)
    reduce({Integer.pow(b, m), Integer.pow(a, m)})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    :math.pow(x, a/b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(r :: rational) :: rational
  def reduce(r) do
    {a, b} = r
    if a == 0 do
      {0, 1}
    else
      gcd = Integer.gcd(a, b)
      {r1, r2} = {div(a, gcd), div(b, gcd)}
      if r2 < 0 do
        {-r1, -r2}
      else
        {r1, r2}
      end
    end
  end
end
