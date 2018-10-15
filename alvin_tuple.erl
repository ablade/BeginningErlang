
-module(alvin_tuple).
-export([my_tuple_to_list/1]).

my_tuple_to_list(T) when is_tuple(T) -> [element(Pos,T) || Pos <- lists:seq(1,tuple_size(T))].
