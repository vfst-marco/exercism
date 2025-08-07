defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)
    discounted_rate = apply_discount(daily_rate, discount)
    ceil(discounted_rate * 22)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate = daily_rate(hourly_rate)
    discounted_rate = apply_discount(daily_rate, discount)
    floor(10 * budget / discounted_rate) / 10
  end
end
