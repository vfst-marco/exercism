-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).


add(Elem, Set) -> case lists:member(Elem, Set) of
	true -> Set;
	false -> [Elem | Set]
end.

contains(Elem, Set) -> lists:member(Elem, Set).

difference(Set1, Set2) -> lists:subtract(Set1, Set2).

disjoint(Set1, Set2) -> (Set1 == lists:subtract(Set1, Set2)) and (Set2 == lists:subtract(Set2, Set1)).

empty(Set) -> [] == Set.

equal(Set1, Set2) -> lists:sort(Set1) == lists:sort(Set2).

from_list(List) -> lists:uniq(List).

intersection(Set1, Set2) -> difference(union(Set1, Set2), union(difference(Set1, Set2), difference(Set2, Set1))).

subset(Set1, Set2) -> empty(lists:subtract(Set1, Set2)).

union(Set1, Set2) -> lists:uniq(lists:merge(Set1, Set2)).
