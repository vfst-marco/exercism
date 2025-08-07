-module(series).

-export([slices/2]).


slices(SliceLength, Series) when SliceLength > length(Series); SliceLength =< 0 -> error(badarg);
slices(SliceLength, Series) ->
  SliceStarts = lists:seq(1, length(Series) - SliceLength + 1),
  lists:map(fun (Start) -> string:sub_string(Series, Start, Start + SliceLength - 1) end, SliceStarts).
