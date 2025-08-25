defmodule Bob do

  @spec hey(String.t()) :: String.t()
  def hey(input) do
    trimmed_input = String.trim(input)
    has_letters = String.match?(trimmed_input, ~r/[^\W\d_]/u)
    question = String.ends_with?(trimmed_input, "?")
    yelled = has_letters && trimmed_input == String.upcase(trimmed_input)
    yelled_question = yelled && question
    silence = trimmed_input == ""
    cond do
      silence -> "Fine. Be that way!"
      yelled_question -> "Calm down, I know what I'm doing!"
      question -> "Sure."
      yelled -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

end
