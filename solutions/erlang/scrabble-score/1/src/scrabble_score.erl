-module(scrabble_score).

-export([score/1]).

-define(SCORE_TABLE, 
   [{"AEIOULNRST", 1},
    {"DG", 2},
    {"BCMP", 3},
    {"FHVWY", 4},
    {"K", 5},
    {"JX", 8},
    {"QZ", 10}]).

score(Word) -> 
  lists:sum(
    lists:flatten(
      lists:map(fun (Letter) -> letter_value(Letter) end, string:uppercase(Word)))).

letter_value(Letter) ->
  lists:map(
    fun ({A, B}) -> 
      case lists:member(Letter, A) of
        true -> B;
        _ -> 0
      end
    end,
    ?SCORE_TABLE).
