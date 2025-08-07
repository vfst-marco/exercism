-module(darts).

-export([score/2]).

% * If the dart lands outside the target, player earns no points (0 points).
% * If the dart lands in the outer circle of the target, player earns 1 point.
% * If the dart lands in the middle circle of the target, player earns 5 points.
% * If the dart lands in the inner circle of the target, player earns 10 points.

% The outer circle has a radius of 10 units (This is equivalent to the total radius for the entire target), 
% the middle circle a radius of 5 units, 
% and the inner circle a radius of 1. 
% Of course, they are all centered to the same point (That is, the circles are [concentric](http://mathworld.wolfram.com/ConcentricCircles.html)) 
% defined by the coordinates (0, 0).
score(X, Y) -> 
  Distance = math:sqrt(X*X + Y*Y),
  score(Distance).

score(Distance) when Distance > 10 -> 0;
score(Distance) when Distance >  5 -> 1;
score(Distance) when Distance >  1 -> 5;
score(_Distance) -> 10.
