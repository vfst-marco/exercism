defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    username
    |> Enum.filter(&(&1 >= ?a && &1 <= ?z || &1 in [?_, ?ä, ?ö, ?ü, ?ß]))
    |> Enum.map(&(
      case &1 do
        ?ä -> [?a, ?e]
        ?ö -> [?o, ?e]
        ?ü -> [?u, ?e]
        ?ß -> [?s, ?s]
        _ -> [&1]
      end
      ))
    |> List.flatten()
  end

end
