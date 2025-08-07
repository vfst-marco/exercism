-module(palindrome_products).

-export([largest/2, smallest/2]).


largest(Min, Max) -> 
  Palindromes = allPalindromes(Min, Max),
  MaxPal = lists:max(lists:map(fun ({A, _B}) -> A end, Palindromes)),
  Pairs = lists:filter(fun({A, _B}) -> A == MaxPal end, Palindromes),
  {MaxPal, lists:map(fun ({_, P}) -> P end, Pairs)}.

smallest(Min, Max) -> 
  Palindromes = allPalindromes(Min, Max),
  MinPal = lists:min(lists:map(fun ({A, _B}) -> A end, Palindromes)),
  Pairs = lists:filter(fun({A, _B}) -> A == MinPal end, Palindromes),
  {MinPal, lists:map(fun ({_, P}) -> P end, Pairs)}.

allPalindromes(Min, Max) -> [{X * Y, {X, Y}} || X <- lists:seq(Min, Max), Y <- lists:seq(Min, X), is_palindrome(X * Y)].

is_palindrome(X) ->
  Str = integer_to_list(X),
  Str == lists:reverse(Str).
