-module(simple_linked_list).

-export([cons/2, count/1, empty/0, from_native_list/1,
     head/1, reverse/1, tail/1, to_native_list/1]).

empty() -> empty.

cons(Elt, List) -> {Elt, List}.

head({Elt, _Rest}) -> Elt.

tail({_Elt, Rest}) -> Rest.

reverse(List) -> reverse(List, empty).
reverse(empty, Acc) -> Acc;
reverse({Elt, Rest}, Acc) -> reverse(Rest, cons(Elt, Acc)).

count(empty) -> 0;
count({_Elt, Rest}) -> 1 + count(Rest).

to_native_list(empty) -> [];
to_native_list({Elt, Rest}) -> [Elt | to_native_list(Rest)].

from_native_list([]) -> empty;
from_native_list([Elt | Rest]) -> cons(Elt, from_native_list(Rest)).
