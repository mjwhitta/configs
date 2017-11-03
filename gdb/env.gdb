set $SHOW_COLOR=1
set $SHOW_CONTEXT=0

define color-on
    set $SHOW_COLOR=1
    source ~/.gdb/prompt.gdb
end
document color-on
    Enable display of color
end

define color-off
    set $SHOW_COLOR=0
    source ~/.gdb/prompt.gdb
end
document color-off
    Disable display of color
end

define context-on
    set $SHOW_CONTEXT=1
end
document context-on
    Enable display of context on every program stop
end

define context-off
    set $SHOW_CONTEXT=0
end
document context-off
    Disable display of context on every program stop
end
