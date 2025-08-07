-module(bob).

-export([response/1]).



% - **"Sure."**
%   This is his response if you ask him a question, such as "How are you?"
%   The convention used for questions is that it ends with a question mark.
% - **"Whoa, chill out!"**
%   This is his answer if you YELL AT HIM.
%   The convention used for yelling is ALL CAPITAL LETTERS.
% - **"Calm down, I know what I'm doing!"**
%   This is what he says if you yell a question at him.
% - **"Fine. Be that way!"**
%   This is how he responds to silence.
%   The convention used for silence is nothing, or various combinations of whitespace characters.
% - **"Whatever."**
%   This is what he answers to anything else.


response(RawString) ->
  String = string:trim(RawString),
  NonEmpty = string:length(String) > 0,
  Question = case NonEmpty of
    true -> lists:last(string:to_graphemes(String)) == $?;
    false -> false
  end,
  Yelled = (string:uppercase(String) == String) and (re:run(String,"[a-zA-Z]+") =/= nomatch),
  case {Question, Yelled, NonEmpty} of
    {_, _, false} -> "Fine. Be that way!";
    {true, true, _} -> "Calm down, I know what I'm doing!";
    {true, _, _} -> "Sure.";
    {false, true, _} -> "Whoa, chill out!";
    {_, _, _} -> "Whatever."
  end.
