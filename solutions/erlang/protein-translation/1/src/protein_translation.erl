-module(protein_translation).

-export([proteins/1]).

% AUG	Methionine
% UUU, UUC	Phenylalanine
% UUA, UUG	Leucine
% UCU, UCC, UCA, UCG	Serine
% UAU, UAC	Tyrosine
% UGU, UGC	Cysteine
% UGG	Tryptophan
% UAA, UAG, UGA	STOP

proteins(X) when is_list(X) -> proteins(list_to_binary(X));
proteins(X) when is_binary(X) -> 
  Result = proteins(X, []),
  case is_list(Result) of
    true -> {ok, lists:reverse(Result)};
    _ -> {error, Result}
  end.

proteins(<<>>, Acc) -> Acc;
proteins(<<"AUG", Rest/binary>>, Acc) -> proteins(Rest, [methionine | Acc]);

proteins(<<"UUU", Rest/binary>>, Acc) -> proteins(Rest, [phenylalanine | Acc]);
proteins(<<"UUC", Rest/binary>>, Acc) -> proteins(Rest, [phenylalanine | Acc]);

proteins(<<"UUA", Rest/binary>>, Acc) -> proteins(Rest, [leucine | Acc]);
proteins(<<"UUG", Rest/binary>>, Acc) -> proteins(Rest, [leucine | Acc]);

proteins(<<"UCU", Rest/binary>>, Acc) -> proteins(Rest, [serine | Acc]);
proteins(<<"UCC", Rest/binary>>, Acc) -> proteins(Rest, [serine | Acc]);
proteins(<<"UCA", Rest/binary>>, Acc) -> proteins(Rest, [serine | Acc]);
proteins(<<"UCG", Rest/binary>>, Acc) -> proteins(Rest, [serine | Acc]);

proteins(<<"UAU", Rest/binary>>, Acc) -> proteins(Rest, [tyrosine | Acc]);
proteins(<<"UAC", Rest/binary>>, Acc) -> proteins(Rest, [tyrosine | Acc]);

proteins(<<"UGU", Rest/binary>>, Acc) -> proteins(Rest, [cysteine | Acc]);
proteins(<<"UGC", Rest/binary>>, Acc) -> proteins(Rest, [cysteine | Acc]);

proteins(<<"UGG", Rest/binary>>, Acc) -> proteins(Rest, [tryptophan | Acc]);

proteins(<<"UAA", _Rest/binary>>, Acc) -> Acc;
proteins(<<"UAG", _Rest/binary>>, Acc) -> Acc;
proteins(<<"UGA", _Rest/binary>>, Acc) -> Acc;
proteins(_, _) -> badarg.