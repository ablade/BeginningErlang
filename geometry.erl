-module(geometry).
%-import([math]).
-export([area/1]).

area({circle,R}) -> math:pi()*math:pow(R,2);
area({square,S}) -> S*S;
area({rectangle,W,H}) -> W*H.
