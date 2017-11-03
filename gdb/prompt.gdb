if ($SHOW_COLOR)
    set prompt \001\033[37m\002$ \001\033[0m\002

    # TODO
    #shell echo -n "set prompt \001\033[37m\002" >/tmp/prompt.gdb
    #shell echo -n " $(date +%-I:%M:%S) " >>/tmp/prompt.gdb
    #shell echo -n "> \001\033[0m\002" >>/tmp/prompt.gdb
    #source /tmp/prompt.gdb
else
    set prompt \001\002$ \001\002
end
