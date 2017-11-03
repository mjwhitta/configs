define stack
    info stack
end
document stack
    Print call stack
end

define frame
    info frame
    info args
    info locals
end
document frame
    Print stack frame
end

#define showstack16
#    set $_i=16*$arg0
#    while ($_i > 0)
#        hexdump $esp+$_i
#        set $_i=$_i-16
#    end
#end
#document showstack16
#    Print X 16 word lines of the stack
#    Usage: showstack16 [integer]
#end

define showstack
    set $_counter=($arg0-1)*4

    while ($_counter > 0)
        hex_word_formatted $esp+$_counter
        set $_counter=$_counter-4
    end

    hex_word_formatted $esp
end
document showstack
    Shows X words of the stack in a formatted view
    Usage: showstack [integer]
end

### Reminder Info About the Stack ###
define redbg
    #clear all text attributes
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf $arg0
    #make the text background red
    if ($SHOW_COLOR)
        echo \033[30;41m
    end
    printf $arg1
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf $arg2
end
document redbg
    print arg0 normally arg1 as black on red and arg2 normally
end

define greenbg
    #clear all text attributes
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf $arg0
    #make the text background green and foreground black
    if ($SHOW_COLOR)
        echo \033[30;42m
    end
    printf $arg1
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf $arg2
end
document greenbg
    print arg0 normally arg1 as black on green and arg2 normally
end

define bluebg
    #clear all text attributes
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf $arg0
    #make the text background blue
    if ($SHOW_COLOR)
        echo \033[30;44m
    end
    printf $arg1
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf $arg2
end
document bluebg
    print arg0 normally arg1 as black on blue and arg2 normally
end

define stacklayout
    #clear all text attributes
    if ($SHOW_COLOR)
        echo \033[0m
    end
    printf "\n"
    printf "                |                                    |\n"
    printf "                |                                    |\n"
    printf "                |            Unused Stack            |\n"
    printf "                |      (Lower memory addresses)      |\n"
    redbg "                |", " ---------------------------------- ", "|\n"
    redbg "[ ESP  ] -----> |", "       funcC Local Variables        ", "|\n"
    redbg "                |", " ---------------------------------- ", "|\n"
    redbg "[ FS:0 ] -----> |", " Next Exception_Registration_Record ", "|----     ^\n"
    redbg "                |", " ---------------------------------- ", "|    |    |\n"
    redbg "                |", "      funcC Exception Handler       ", "|    |    v\n"
    redbg "                |", " ---------------------------------- ", "|    |\n"
    redbg "[ EBP  ] -----> |", "                                    ", "|    |\n"
    redbg "                |", "            funcB's EBP             ", "|    |\n"
    redbg "            ----|", "                                    ", "|    |\n"
    redbg "           |    |", " ---------------------------------- ", "|    |\n"
    redbg "           |    |", "      Return Address in funcB       ", "|    |\n"
    redbg "           |    |", " ---------------------------------- ", "|    |\n"
    redbg "           |    |", "          funcC Argument 1          ", "|    |\n"
    redbg "           |    |", " ---------------------------------- ", "|    |\n"
    redbg "           |    |", "          funcC Argument 2          ", "|    |\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |\n"
    bluebg "           |    |", "        funcB Local Variables       ", "|    |\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |\n"
    bluebg "           |    |", "                                    ", "| <--     ^\n"
    bluebg "           |    |", " Next Exception_Registration_Record ", "|         |\n"
    bluebg "           |    |", "                                    ", "|----     |\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |    |\n"
    bluebg "           |    |", "       funcB Exception Handler      ", "|    |    v\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |\n"
    bluebg "            --> |", "                                    ", "|    |\n"
    bluebg "                |", "             funcA's EBP            ", "|    |\n"
    bluebg "            ----|", "                                    ", "|    |\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |\n"
    bluebg "           |    |", "       Return Address in funcA      ", "|    |\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |\n"
    bluebg "           |    |", "          funcB Argument 1          ", "|    |\n"
    bluebg "           |    |", " ---------------------------------- ", "|    |\n"
    bluebg "           |    |", "          funcB Argument 2          ", "|    |\n"
    greenbg "           |    |", " ---------------------------------- ", "|    |\n"
    greenbg "           |    |", "        funcA Local Variables       ", "|    |\n"
    greenbg "           |    |", " ---------------------------------- ", "|    |\n"
    greenbg "           |    |", " Next Exception_Registration_Record ", "| <--     ^\n"
    greenbg "           |    |", " ---------------------------------- ", "|         |\n"
    greenbg "           |    |", "       funcA Exception Handler      ", "|         v\n"
    greenbg "           |    |", " ---------------------------------- ", "|\n"
    greenbg "            --> |", "            Caller's EBP            ", "|\n"
    greenbg "                |", " ---------------------------------- ", "|\n"
    greenbg "                |", "      Return Adress in Caller       ", "|\n"
    greenbg "                |", " ---------------------------------- ", "|\n"
    greenbg "                |", "          funcA Argument 1          ", "|\n"
    greenbg "                |", " ---------------------------------- ", "|\n"
    greenbg "                |", "          funcA Argument 2          ", "|\n"
    printf  "                 ====================================\n"
    printf  "                           Bottom of stack\n"
    printf  "                       (High memory addresses)\n"
end
document stacklayout
    Show how a basic stack may look at runtime
    NOTE: The exception handler stuff may or may not be there.
end
