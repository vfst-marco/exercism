-module(list_ops).

-export([append/2, concat/1, filter/2, length/1, map/2, foldl/3, foldr/3,
	 reverse/1]).
-compile({no_auto_import,[length/1]}).

append(List1, List2) -> foldr(fun (X, Acc) -> [X | Acc] end, List2, List1).

concat(List) -> foldr(fun append/2, [], List).

filter(Predicate, List) -> foldr(
	fun (X, Acc) ->
		case Predicate(X) of
			true -> [X | Acc];
			_ -> Acc
		end
	end,
	[],
	List).

length(List) -> foldl(fun (_, Acc) -> 1 + Acc end, 0, List).

map(Function, List) -> foldr(fun (X, Acc) -> [Function(X) | Acc] end, [], List).

foldl(_Function, Start, []) -> Start;
foldl(Function, Start, [X | Rest]) -> foldl(Function, Function(X, Start), Rest).

foldr(_Function, Start, []) -> Start;
foldr(Function, Start, [X | Rest]) -> Function(X, foldr(Function, Start, Rest)).

reverse(List) -> foldl(fun (X, Acc) -> [X | Acc] end, [], List).
