defmodule SwiftScheduling do
  @doc """
  Convert delivery date descriptions to actual delivery dates, based on when the meeting started.
  """
  @spec delivery_date(NaiveDateTime.t(), String.t()) :: NaiveDateTime.t()

  def delivery_date(meeting_date, "NOW"), do: NaiveDateTime.shift(meeting_date, hour: 2)

  def delivery_date(meeting_date, "ASAP") do
    if Time.before?(meeting_date, ~T[13:00:00]) do
      NaiveDateTime.to_date(meeting_date)
      |> NaiveDateTime.new!(~T[17:00:00])
    else
      Date.add(meeting_date, 1)
      |> NaiveDateTime.new!(~T[13:00:00])
    end
  end

  def delivery_date(meeting_date, "EOW") do
    day_of_week = Date.day_of_week(meeting_date)
    if day_of_week <= 3 do
      Date.end_of_week(meeting_date, :saturday)
      |> NaiveDateTime.new!(~T[17:00:00])
    else
      Date.end_of_week(meeting_date, :monday)
      |> NaiveDateTime.new!(~T[20:00:00])
    end
  end

  def delivery_date(meeting_date, description) do
    cond do
      String.ends_with?(description, "M") ->
        month = String.trim_trailing(description, "M") |> String.to_integer
        delivery_date_month(meeting_date, month)
      String.starts_with?(description, "Q") ->
        quarter = String.trim_leading(description, "Q") |> String.to_integer
        delivery_date_quarter(meeting_date, quarter)
      true -> raise ArgumentError, "Invalid delivery date description: #{description}"
    end
  end

  defp delivery_date_month(meeting_date, planned_month) do
    {{year, month, _day}, _time} = NaiveDateTime.to_erl(meeting_date)

    target_year =
      cond do
        planned_month > month -> year
        true -> year + 1
      end

    first_day = Date.from_erl!({target_year, planned_month, 1})
    day_of_week = Date.day_of_week(first_day)
    workday =
      if workday?(day_of_week) do
        first_day
      else
        Date.end_of_week(first_day, :tuesday)
      end
    NaiveDateTime.new!(workday, ~T[08:00:00])
  end

  defp delivery_date_quarter(meeting_date, quarter) do
    {{year, month, _day}, _time} = NaiveDateTime.to_erl(meeting_date)
    planned_month = quarter * 3
    target_year =
      cond do
        planned_month > month -> year
        true -> year + 1
      end

      last_day = Date.end_of_month(Date.from_erl!({target_year, planned_month, 1}))
      day_of_week = Date.day_of_week(last_day)
      workday =
        if workday?(day_of_week) do
          last_day
        else
          Date.add(last_day, - (day_of_week - 5))
        end
      NaiveDateTime.new!(workday, ~T[08:00:00])
  end

  defp workday?(day_of_week), do: day_of_week <= 5
end
