-module(diamond).

-export([rows/1, row/2]).


rows($A) -> "A";

rows([StartLetter | []]) -> 
  Chars = lists:seq($A, StartLetter) ++ lists:seq(StartLetter-1, $A, -1),
  Result = lists:map(fun (L) -> row(StartLetter, L) end, Chars),
  Result.

row(StartLetter, $A) ->
  TotalLen = StartLetter - $A,
  Pad = lists:duplicate(TotalLen, $ ),
  Pad ++ [$A | Pad];

row(StartLetter, Letter) ->
  OuterLen = StartLetter - Letter,
  InnerLen = (Letter - $A) * 2 - 1,
  OuterPad = lists:duplicate(OuterLen, $ ),
  InnerPad = lists:duplicate(InnerLen, $ ),
  OuterPad ++ [Letter | InnerPad] ++ [Letter | OuterPad].
