-module(secret_handshake).

-export([commands/1]).

%  1 - 00001 = wink
%  2 - 00010 = double blink
%  4 - 00100 = close your eyes
%  8 - 01000 = jump
% 16 - 10000 = Reverse the order of the operations in the secret handshake.

commands(Number) -> lists:reverse(command(Number)).

command(Number) when Number >= 16 -> lists:reverse(command(Number - 16));
command(Number) when Number >= 8 -> ["jump" | command(Number - 8)];
command(Number) when Number >= 4 -> ["close your eyes" | command(Number - 4)];
command(Number) when Number >= 2 -> ["double blink" | command(Number - 2)];
command(Number) when Number == 1 -> ["wink"];
command(_) -> [].