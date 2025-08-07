-module(rational_numbers).

-export([absolute/1, add/2, divide/2, exp/2, mul/2, reduce/1, sub/2]).


absolute({A, B}) -> reduce({abs(A), abs(B)}).

add({A1, B1}, {A2, B2}) -> reduce({A1 * B2 + A2 * B1, B1 * B2}).
sub({A1, B1}, {A2, B2}) -> reduce({A1 * B2 - A2 * B1, B1 * B2}).

mul({A1, B1}, {A2, B2}) -> reduce({A1 * A2, B1 * B2}).
divide({A1, B1}, {A2, B2}) -> reduce({A1 * B2, A2 * B1}).

exp({A, B}, N) when is_integer(N), N >= 0 -> reduce({pow(A, N), pow(B, N)});
exp({A, B}, N) when is_integer(N) -> reduce(exp({B, A}, abs(N)));
exp({A, B}, X) when is_float(X) -> {math:pow(A, X), math:pow(B, X)};
exp(X, {A, B}) -> math:pow(math:pow(X, A), 1 / B).

reduce({A, B}) when B < 0 -> reduce({-A, -B});
reduce({A, B}) when is_integer(A), is_integer(B) -> 
  GCD = gcd(abs(A), abs(B)),
  {A div GCD, B div GCD}.

gcd(A, B) when A < B -> gcd(B, A);
gcd(A, B) when B =:= 0 -> A;
gcd(A, B) -> gcd(B, A rem B).

pow(X, N) when is_integer(N), N >= 0 -> pow(X, N, 1).
pow(_X, 0, Acc) -> Acc;
pow(X, N, Acc) -> pow(X, N - 1, X * Acc).