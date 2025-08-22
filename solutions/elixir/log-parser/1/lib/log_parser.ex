defmodule LogParser do
  def valid_line?(line) do
    level_regex = ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
    String.match?(line, level_regex)
  end

  def split_line(line) do
    separator = ~r/<[~*=-]*>/
    String.split(line, separator)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end-of-line[0-9]+/i, "")
  end

  def tag_with_user_name(line) do
    user_name_regex = ~r/user\s+(\S+)/i
    case Regex.run(user_name_regex, line) do
      nil -> line
      [_, user_name] -> "[USER] #{user_name} #{line}"
    end
  end
end
