defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
    Time.before?(datetime, ~T[12:00:00])
  end

  @spec return_date(any()) :: nil
  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29
    Date.add(checkout_datetime, days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    if Date.before?(actual_return_datetime, planned_return_date) do
      0
    else
      Date.diff(actual_return_datetime, planned_return_date)
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = datetime_from_string(checkout)
    actual_return_date = datetime_from_string(return)
    planned_return_date = return_date(checkout_date)
    days_late = days_late(planned_return_date, actual_return_date)

    fee = days_late * rate

    if monday?(actual_return_date) do
      Integer.floor_div(fee, 2)
    else
      fee
    end
  end
end
