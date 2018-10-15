% 5. Write a module called math_functions.erl , exporting the functions even/1 and
% odd/1 . The function even(X) should return true if X is an even integer and
% otherwise false. odd(X) should return true if X is an odd integer.
%
% 6. Add a higher-order function to math_functions.erl called filter(F, L) , which returns
% all the elements X in L for which F(X) is true .
%
% 7. Add a function split(L) to math_functions.erl , which returns {Even, Odd} where
% Even is a list of all the even numbers in L and Odd is a list of all the odd
% numbers in L . Write this function in two different ways using accumulators
% and using the function filter you wrote in the previous exercise.

-module(math_functions).

-export([even/1,odd/1,filter/2]).
%-export([even/1,odd/1,filter/2,split/1]).

%Item 5
even(X) when is_integer(X) -> X rem 2 =:= 0.
odd(X) when is_integer(X) -> X rem 2 /= 0.

%Item 6
filter(F,L) -> [X || X <- L, F(X)].

%Item 7  
