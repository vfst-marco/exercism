-module(complex_numbers).

-export([abs/1, add/2, conjugate/1, divide/2, equal/2, exp/1, imaginary/1, inverse/1, mul/2, new/2,
	 real/1, sub/2]).


new(R, I) -> {R, I}.

real({R, _I}) -> R.
imaginary({_R, I}) -> I.

equal({R1, I1}, {R2, I2}) -> (erlang:abs(R1 - R2) < 0.005) and (erlang:abs(I1 - I2) < 0.005).

mul({A, B}, {C, D}) -> new(A*C - B*D, B*C + A*D).
add({A, B}, {C, D}) -> new(A+C, B+D).
sub({A, B}, {C, D}) -> new(A-C, B-D).

abs({A, B}) -> math:sqrt(A*A + B*B).

conjugate({A, B}) -> new(A, -B).

inverse({A, B}) -> 
	X = (A*A + B*B),
	new(A / X, -B / X).

divide({A, B}, {C, D}) -> 
	X = (C*C + D*D),
	R = (A*C + B*D) / X,
	I = (B*C - A*D) / X,
	new(R, I).


exp({A, B}) -> 
	X = math:exp(A),
	new(X * math:cos(B), X * math:sin(B)).




