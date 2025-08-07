-module(prime_factors).

-export([factors/1]).


factors(Value) -> factors(Value, 2, []).

factors(1, _, Acc) -> Acc;
factors(Value, Factor, Acc) when Value rem Factor == 0 -> 
  factors(Value div Factor, Factor, [Factor | Acc]);
factors(Value, Factor, Acc) -> 
  factors(Value, Factor + 1, Acc).