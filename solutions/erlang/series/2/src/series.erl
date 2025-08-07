-module(series).

-export([slices/2]).


slices(SliceLength, Series) when SliceLength > length(Series); SliceLength =< 0 -> error(badarg);
slices(SliceLength, Series) ->
  SliceStarts = lists:seq(0, length(Series) - SliceLength),
  [string:slice(Series, Start, SliceLength) || Start <- SliceStarts].
