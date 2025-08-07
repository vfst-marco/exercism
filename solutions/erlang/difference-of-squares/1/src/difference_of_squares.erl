-module(difference_of_squares).

-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).


difference_of_squares(Number) -> abs(square_of_sum(Number) - sum_of_squares(Number)).

square_of_sum(Number) -> 
  Numbers = lists:seq(1, Number),
  Sum = lists:sum(Numbers),
  Sum * Sum.

sum_of_squares(Number) -> 
  Numbers = lists:seq(1, Number),
  Squares = lists:map(fun (X) -> X * X end, Numbers),
  lists:sum(Squares).
