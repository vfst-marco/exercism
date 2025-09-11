defmodule Ledger do
  @doc """
  Format the given entries given a currency and locale
  """
  @type currency :: :usd | :eur
  @type locale :: :en_US | :nl_NL
  @type entry :: %{amount_in_cents: integer(), date: Date.t(), description: String.t()}

  @spec format_entries(currency(), locale(), list(entry())) :: String.t()
  def format_entries(currency, locale, entries) do
    header = format_header(locale)
    entries = format_entries_rows(currency, locale, entries)
    header <> entries
  end

  defp format_header(:en_US), do: "Date       | Description               | Change       \n"
  defp format_header(:nl_NL), do: "Datum      | Omschrijving              | Verandering  \n"

  defp format_entries_rows(_currency, _locale, []), do: ""
  defp format_entries_rows(currency, locale, entries) do
    entries
    |> Enum.sort(&sort_entries_fn/2)
    |> Enum.map(&format_entry(currency, locale, &1))
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end

  defp sort_entries_fn(a, b) do
    cond do
      a.date.day != b.date.day -> a.date.day < b.date.day
      a.description != b.description -> a.description < b.description
      true -> a.amount_in_cents <= b.amount_in_cents
    end
  end

  defp format_entry(currency, locale, entry) do
    year = entry.date.year |> to_string()
    month = entry.date.month |> to_string() |> String.pad_leading(2, "0")
    day = entry.date.day |> to_string() |> String.pad_leading(2, "0")

    date = format_date(locale, year, month, day)

    number = format_number(entry.amount_in_cents, locale)

    amount = format_amount(currency, locale, entry.amount_in_cents, number)
      |> String.pad_leading(14, " ")

    description = format_description(entry.description)
      |> String.pad_trailing(25, " ")

    date <> " | " <> description <> " |" <> amount
  end


  defp format_date(:en_US, year, month, day), do: "#{month}/#{day}/#{year}"
  defp format_date(:nl_NL, year, month, day), do: "#{day}-#{month}-#{year}"

  defp format_number(amount_in_cents, :en_US), do: format_number(amount_in_cents, ",", ".")
  defp format_number(amount_in_cents, :nl_NL), do: format_number(amount_in_cents, ".", ",")

  defp format_number(amount_in_cents, thousands_sep, decimal_sep) do
    abs_amount = abs(amount_in_cents)
    reversed_euros = div(abs_amount, 100) |> Integer.to_string() |> String.reverse() |> String.graphemes()
    cents = rem(abs_amount, 100) |> Integer.to_string() |> String.pad_leading(2, "0")

    euros_with_commas =
      reversed_euros
      |> Enum.chunk_every(3)
      |> Enum.intersperse([thousands_sep])
      |> List.flatten()
      |> Enum.reverse()
      |> Enum.join

    euros_with_commas <> decimal_sep <> cents
  end


  defp format_amount(currency, :en_US, amount_in_cents, number) when amount_in_cents < 0, do: "(" <> currency_symbol(currency) <> number <> ")"
  defp format_amount(currency, :nl_NL, amount_in_cents, number) when amount_in_cents < 0, do: currency_symbol(currency) <> " -" <> number <> " "

  defp format_amount(currency, :en_US, _amount_in_cents, number), do: currency_symbol(currency) <> number <> " "
  defp format_amount(currency, :nl_NL, _amount_in_cents, number), do: currency_symbol(currency) <> " " <> number <> " "

  defp currency_symbol(:usd), do: "$"
  defp currency_symbol(:eur), do: "€"

  defp format_description(description) do
    if String.length(description) > 25 do
      String.slice(description, 0, 22) <> "..."
    else
      description
    end
  end
end
