-module(palindrome_products).

-export([largest/2, smallest/2]).


largest(Min, Max) -> 
  Pairs = [{X, Y} || X <- lists:seq(Max, Min, -1), Y <- lists:seq(Max, X, -1)],
  Palindrome = max(findPalindrome(Pairs)),
  {Palindrome, factors(Palindrome, Min, Max)}.

smallest(Min, Max) -> 
  Pairs = [{X, Y} || X <- lists:seq(Min, Max), Y <- lists:seq(Min, X)],
  Palindrome = min(findPalindrome(Pairs)),
  {Palindrome, factors(Palindrome, Min, Max)}.

findPalindrome([]) -> [];
findPalindrome([{X, Y}| Rest]) ->
  case is_palindrome(X * Y) of
    true -> [X * Y | findPalindrome(Rest)];
    false -> findPalindrome(Rest)
  end.


is_palindrome(X) ->
  Str = integer_to_list(X),
  Str == lists:reverse(Str).

factors(undefined, _, _) -> undefined;
factors(X, Min, Max) ->
  SqrtMax = trunc(math:sqrt(X)),
  Factors = [{A, X div A} || A <- lists:seq(1, SqrtMax), X rem A == 0],
  Range = lists:seq(Min, Max),
  [{A, B} || {A, B} <- Factors, lists:member(A, Range), lists:member(B, Range)].

max([]) -> undefined;
max(List) -> lists:max(List).

min([]) -> undefined;
min(List) -> lists:min(List).