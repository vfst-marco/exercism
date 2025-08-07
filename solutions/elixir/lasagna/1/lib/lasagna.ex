defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(elapsedTimeInOven), do: max(0, expected_minutes_in_oven() - elapsedTimeInOven)

  def preparation_time_in_minutes(layers), do: layers * 2

  def total_time_in_minutes(layers, elapsedTimeInOven) do
    preparation_time_in_minutes(layers) + elapsedTimeInOven
  end

  def alarm(), do: "Ding!"
end
