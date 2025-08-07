-module(queen_attack).

-export([can_attack/2]).


can_attack({Wx, Wy}, {Bx, By}) -> 
  Horizontal = Wx == Bx,
  Vertical   = Wy == By,
  Diagonal   = abs(Wx - Bx) == abs(Wy - By),
  Horizontal or Vertical or Diagonal.
