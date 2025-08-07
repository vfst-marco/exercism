-module(strain).

-export([keep/2, discard/2]).

keep(Fn, List) ->
  {Keep, _Discard} = split(Fn, List),
    Keep.

discard(Fn, List) ->
  {_Keep, Discard} = split(Fn, List),
	Discard.

split(_, []) -> {[], []};
split(Fn, [X | Rest]) ->
    {K, D} = split(Fn, Rest),
    case Fn(X) of
        true -> {[X | K], D};
        false -> {K, [ X | D]}
    end.