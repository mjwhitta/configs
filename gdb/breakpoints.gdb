define bp
    break *$arg0
end
document bp
    Set a breakpoint on address
    Usage: bp addr
end

define bpc
    clear $arg0
end
document bpc
    Clear breakpoint at function/address
    Usage: bpc addr
end

define bpd
    disable $arg0
end
document bpd
    Disable breakpoint #
    Usage: bpd num
end

define bpe
    enable $arg0
end
document bpe
    Enable breakpoint #
    Usage: bpe num
end

define bpl
    info breakpoints
end
document bpl
    List breakpoints
end

define bpm
    awatch $arg0
end
document bpm
    Set a read/write breakpoint on address
    Usage: bpm addr
end

define bpt
    tbreak $arg0
end
document bpt
    Set a temporary breakpoint on address
    Usage: bpt addr
end
