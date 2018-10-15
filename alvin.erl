
% Look up the definitions of erlang:now/0 , erlang:date/0 , and erlang:time/0 . Write a
% function called my_time_func(F) , which evaluates the fun F and times how
% long it takes. Write a function called my_date_string() that neatly formats the
% current date and time
-module(alvin).
-export([my_time_func/1,my_date_string/0]).

my_time_func(F) when is_function(F) ->
  T1 = now(),
  F(),
  T2 = now(),
  SECONDS = timer:now_diff(T2,T1) / 1000000,
  io:format("Seconds :~f~n",[SECONDS]).


%TODO find a better way to format the 24 hour into am and pm
my_date_string() ->
  {YYYY,MM,DD} = date(),
  {HH,MIN,SEC} = time(),
  io:format("The date is ~s ~p, ~p time ~p:~2..0w:~p~n",[month(MM),DD,YYYY,HH,MIN,SEC]).


month(1) -> "Jan";
month(2) -> "Feb";
month(3) -> "Mar";
month(4) -> "Apr";
month(5) -> "May";
month(6) -> "Jun";
month(7) -> "Jul";
month(8) -> "Aug";
month(9) -> "Sep";
month(10) -> "Oct";
month(11) -> "Nov";
month(12) -> "Dec".
