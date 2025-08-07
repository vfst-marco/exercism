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
  lists:foldl(fun (Letter, Acc) -> letter_value(Letter) + Acc end,
      0,
      string:uppercase(Word)).

letter_value(Letter) ->
  lists:foldl(
    fun ({A, B}, Sum) -> 
      case lists:member(Letter, A) of
        true -> Sum + B;
        _ -> Sum
      end
    end,
    0,
    ?SCORE_TABLE).
