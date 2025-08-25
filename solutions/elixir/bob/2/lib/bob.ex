defmodule Bob do

  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)
    question = String.ends_with?(input, "?")
    yelled = input != String.downcase(input) && input == String.upcase(input)
    yelled_question = yelled && question
    silence = input == ""
    cond do
      yelled_question -> "Calm down, I know what I'm doing!"
      question -> "Sure."
      yelled -> "Whoa, chill out!"
      silence -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

end
