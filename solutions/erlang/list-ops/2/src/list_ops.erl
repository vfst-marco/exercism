-module(list_ops).

-export([append/2, concat/1, filter/2, length/1, map/2, foldl/3, foldr/3,
	 reverse/1]).
-compile({no_auto_import,[length/1]}).

append([X | Rest], List) -> [X | append(Rest, List)];
append([], List) -> List.

concat(List) -> foldr(fun append/2, [], List).

filter(Predicate, [X | Rest]) ->
	case Predicate(X) of
		true -> [X | filter(Predicate, Rest)];
		_ -> filter(Predicate, Rest)
	end;
filter(_, []) -> [].

length([]) -> 0;
length([_ | Rest]) -> 1 + length(Rest).

map(_Function, []) -> [];
map(Function, [X | Rest]) -> [Function(X) | map(Function, Rest)].

foldl(_Function, Start, []) -> Start;
foldl(Function, Start, [X | Rest]) -> foldl(Function, Function(X, Start), Rest).

foldr(_Function, Start, []) -> Start;
foldr(Function, Start, [X | Rest]) -> Function(X, foldr(Function, Start, Rest)).

reverse(List) when is_list(List) -> reverse(List, []).
reverse([X | Rest], Acc) -> reverse(Rest, [X | Acc]);
reverse(_, Acc) -> Acc.
