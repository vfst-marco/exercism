-module(parallel_letter_frequency).

-export([dict/1, frequency/3]).


dict(Strings) ->
  ProcessRefs = lists:map(fun (S) -> start_process(S, self()) end, Strings),
  Dicts = lists:map(fun get_result/1, ProcessRefs),
  lists:foldr(fun merge_maps/2, dict:new(), Dicts).

start_process(String, Parent) ->
  Ref = make_ref(),
  spawn(parallel_letter_frequency, frequency, [String, Parent, Ref]),
  Ref.

frequency(String, Parent, Ref) ->
  Result = count_letters(String, dict:new()),
  Parent ! {Ref, {ok, Result}}.

count_letters([Char | Rest], Dict) ->
  Fun = fun (V) -> V + 1 end,
  NewDict = dict:update(Char, Fun, 1, Dict),
  count_letters(Rest, NewDict);
count_letters(_, Dict) -> 
  Dict.

get_result(Ref) ->
  receive
    {Ref, {ok, Result}} -> Result
  end.

merge_maps(Dict1, Dict2) ->
  Fun = fun (_Key, Value1, Value2) -> Value1 + Value2 end,
  dict:merge(Fun, Dict1, Dict2).
