-module(armstrong_numbers).

-export([is_armstrong_number/1]).


is_armstrong_number(Number) -> 
  Digits = lists:map(fun (X) -> list_to_integer([X]) end, integer_to_list(Number)),
  Exponent = length(Digits),
  Sum = lists:sum(lists:map(fun (X) -> math:pow(X, Exponent) end, Digits)),
  Sum == Number.
