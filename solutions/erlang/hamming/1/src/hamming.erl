-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) when length(Strand1) /= length(Strand2) -> 
  {error, badarg};
distance(Strand1, Strand2) -> 
  Pairs = lists:zipwith(
    fun
        (X, X) -> 0; 
        (_, _) -> 1
    end, 
    Strand1,
    Strand2),
  lists:sum(Pairs).
