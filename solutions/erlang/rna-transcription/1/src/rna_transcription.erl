-module(rna_transcription).

-export([to_rna/1]).

%% G -> C
%% C -> G
%% T -> A
%% A -> U

to_rna(Strand) -> lists:map(fun rna/1, Strand).

rna($G) -> $C;
rna($C) -> $G;
rna($T) -> $A;
rna($A) -> $U.