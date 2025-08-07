-module(palindrome_products).

-export([largest/2, smallest/2]).


largest(Min, Max) when Min > Max -> error(undefined);
largest(Min, Max) -> 
  palBy(max(Max - 200, Min), Max, fun lists:max/1).

smallest(Min, Max) when Min > Max -> error(undefined);
smallest(Min, Max) -> 
  palBy(Min, min(Max, Min + 200), fun lists:min/1).

palBy(Min, Max, Fun) ->
  Palindromes = [{X * Y, {X, Y}} || X <- lists:seq(Min, Max), Y <- lists:seq(Min, X), is_palindrome(X * Y)],
  case Palindromes of 
    [] -> undefined;
    _ -> Candidate = Fun(lists:map(fun ({A, _B}) -> A end, Palindromes)),
         Pairs = lists:filter(fun({A, _B}) -> A == Candidate end, Palindromes),
         {Candidate, lists:map(fun ({_, P}) -> P end, Pairs)}
    end.

is_palindrome(X) ->
  Str = integer_to_list(X),
  Str == lists:reverse(Str).
