-module(afile_server).
-export([start/1, loop/1]).
start(Dir) -> spawn(afile_server, loop, [Dir]).     %Create a new process for the file server
loop(Dir) ->                                        %Loop for ever listening to any messages
    receive
        {Client, list_dir} ->                       %If we get a message saying list_dir
            Client ! {self(), file:list_dir(Dir)};  %Replay to the Client using the BIF file:list_dir of the initial directory
        {Client, {get_file, File}} ->               %If we get a message saying get_file 
            Full = filename:join(Dir, File),        % get the fullpath for the file then 
            Client ! {self(), file:read_file(Full)}; %Send a message back to the client of the content of the file
        %Add a message to put_file
        {Client, {put_file,Filename,Content}} ->                %pattern match PID and message tuple with message id put_file
            Full = filename:join(Dir,Filename),                 %Write the file to the current directory
            Client ! {self(), file:write_file(Full,Content)}    %Finally return a message to the client
    end,
    loop(Dir).