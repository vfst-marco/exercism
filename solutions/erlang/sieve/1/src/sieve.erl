-module(sieve).

-export([primes/1]).


primes(Limit) -> sieve(lists:seq(2, Limit)).

sieve([X | Rest]) -> [X | sieve([A || A <- Rest, A rem X /= 0])];
sieve([]) -> [].
