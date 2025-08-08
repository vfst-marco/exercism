defmodule BirdCount do

  def today([]), do: nil
  def today([head | _tail]) do
    head
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([head | tail]) do
    if head == 0 do
      true
    else
      has_day_without_birds?(tail)
    end
  end

  def total([]), do: 0
  def total([head | tail]) do
    head + total(tail)
  end

  def busy_days([]), do: 0
  def busy_days([head | tail]) do
    if head >= 5 do
      1 + busy_days(tail)
    else
      busy_days(tail)
    end
  end
end
