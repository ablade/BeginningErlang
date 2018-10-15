-module(afile_client).
-export([ls/1, get_file/2,create_write_file/3]).


ls(Server) ->
    %Send a message to the server { send the PID and the list_dir atom}
    Server ! {self(), list_dir},
    receive                         %recieve the replay from the server
        {Server, FileList} ->       %we get the server PID and the FileList  
        FileList
    end.

get_file(Server, File) ->
    Server ! {self(), {get_file, File}},    %Send a message to the Server (PID) get_file and Filename
    receive                                 %Listen for a replay before ending
        {Server, Content} ->                %Pattern match on the PID and Content returned from the server
            Content                         %Return the content
    end.

create_write_file(Server, Filename, Content) ->  %create a function to send a message to the server to write a file with contents
    Server ! {self(),{put_file,Filename,Content}},  %Send a message to the server
    receive
        {Server,Return} ->                          %Recieve from Server with the return from the write operation
            Return
    end.

