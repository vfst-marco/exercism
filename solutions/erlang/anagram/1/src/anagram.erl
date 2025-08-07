-module(anagram).

-export([find_anagrams/2]).


find_anagrams(Subject, Candidates) ->
  lists:filter(is_anagram(Subject), Candidates).

is_anagram(Subject) ->
  LowercasedSubject = string:lowercase(Subject),
  SortedSubject = lists:sort(LowercasedSubject),
  fun (Candidate) ->
    LowercasedCandidate = string:lowercase(Candidate),
    SortedCandidate = lists:sort(LowercasedCandidate),
    (LowercasedSubject =/= LowercasedCandidate) and (SortedCandidate == SortedSubject)
  end.