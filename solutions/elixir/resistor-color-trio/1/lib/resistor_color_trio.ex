defmodule ResistorColorTrio do

  @resistor_color %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) when length(colors) >= 3 do
    [first, second, third] = Enum.take(colors, 3)
    base_value = @resistor_color[first] * 10 + @resistor_color[second]
    multiplier = Integer.pow(10, @resistor_color[third])

    resistance = base_value * multiplier

    cond do
      resistance < 1_000 -> {resistance, :ohms}
      resistance < 1_000_000 -> {div(resistance, 1_000), :kiloohms}
      resistance < 1_000_000_000 -> {div(resistance, 1_000_000), :megaohms}
      true -> {div(resistance, 1_000_000_000), :gigaohms}
    end
  end
end
