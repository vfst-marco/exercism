-module(raindrops).

-export([convert/1]).


convert(Number) when Number rem 3 == 0, Number rem 5 == 0, Number rem 7 == 0 -> "PlingPlangPlong";
convert(Number) when Number rem 3 == 0, Number rem 5 == 0 -> "PlingPlang";
convert(Number) when Number rem 5 == 0, Number rem 7 == 0 -> "PlangPlong";
convert(Number) when Number rem 3 == 0, Number rem 7 == 0 -> "PlingPlong";
convert(Number) when Number rem 3 == 0 -> "Pling";
convert(Number) when Number rem 5 == 0 -> "Plang";
convert(Number) when Number rem 7 == 0 -> "Plong";
convert(Number) -> integer_to_list(Number).
