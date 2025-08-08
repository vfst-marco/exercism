defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.graphemes()
    |> hd()
  end

  def initial(name) do
    first_letter(String.upcase(name)) <> "."
  end

  def initials(full_name) do
    full_name
    |> String.trim()
    |> String.split(~r{\s}, trim: true)
    |> Enum.map(&initial/1)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    i1 = initials(full_name1)
    i2 = initials(full_name2)
    l = String.length(i1) + String.length(i2) + 9
    dashes = String.duplicate("-", l)

    """
    ❤#{dashes}❤
    |  #{i1}  +  #{i2}  |
    ❤#{dashes}❤
    """
  end
end
