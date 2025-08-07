-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).


add(Elem, Set) -> case contains(Elem, Set) of
	true -> Set;
	false -> [Elem | Set]
end.

contains(Elem, Set) -> lists:member(Elem, Set).

difference(Set1, Set2) -> Set1 -- Set2.

disjoint(Set1, Set2) -> empty(intersection(Set1, Set2)).

empty(Set) -> [] == Set.

equal(Set1, Set2) -> lists:sort(Set1) == lists:sort(Set2).

from_list(List) -> lists:uniq(List).

intersection(Set1, Set2) -> [E1 || E1 <- Set1, E2 <- Set2, E1 == E2].

subset(Set1, Set2) -> empty(Set1 -- Set2).

union(Set1, Set2) -> lists:uniq(Set1 ++ Set2).
