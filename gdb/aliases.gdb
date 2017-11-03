# Alias commands
define argv
    show args
end
document argv
    Print program arguments
end

define clear
    shell clear
end
document clear
    Clears the screen
end

define dis
    disassemble $arg0
end
document dis
    Disassemble address
    Usage: dis addr
end

define func
    info functions
end
document func
    Print functions in target
end

define lib
    info sharedlibrary
end
document lib
    Print shared libraries linked to target
end

define sig
    info signals
end
document sig
    Print signal actions for target
end

define srcgdbinit
    set pagination off
    source ~/.gdbinit
    set pagination on
end
document srcgdbinit
    Resource ~/.gdbinit
end

define threads
    info threads
end
document threads
    Print threads in target. Same as `info threads`
end

define u
    info udot
end
document u
    Print kernel 'user' struct for target
end

define var
    info variables
end
document var
    Print variables (symbols) in target
end
