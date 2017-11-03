define datawin
    if ( \
        ($esi & 0x40000000) || \
        ($esi & 0x08000000) || \
        ($esi & 0xBF000000) \
    )
        set $data_addr=$esi
    else
        if ( \
            ($edi & 0x40000000) || \
            ($edi & 0x08000000) || \
            ($edi & 0xBF000000) \
        )
            set $data_addr=$edi
        else
            if ( \
                ($eax & 0x40000000) || \
                ($eax & 0x08000000) || \
                ($eax & 0xBF000000) \
            )
                set $data_addr=$eax
            else
                set $data_addr=$esp
            end
        end
    end

    if ($SHOW_COLOR)
        echo \033[37m
    end
    printf "[%04X:%08X]--------------------", $ds, $data_addr
    printf "--------------------------------------[data]\n"
    if ($SHOW_COLOR)
        echo \033[0m
    end

    ddump 4
end
document datawin
    Display esi edi eax or esp in the data window
end

define context
    clear

    if ($SHOW_COLOR)
        echo \033[37m
    end
    printf "-----------------------------------"
    printf "---------------------------------[registers]\n"
    if ($SHOW_COLOR)
        echo \033[0m
    end

    # Show registers
    reg
    printf "\n"

    if ($SHOW_COLOR)
        echo \033[37m
    end
    printf "[%04X:%08X]--------------------", $ss, $esp
    printf "-------------------------------------[stack]\n"
    if ($SHOW_COLOR)
        echo \033[0m
    end

    # Show stack
    hexdump $sp+0x50
    hexdump $sp+0x40
    hexdump $sp+0x30
    hexdump $sp+0x20
    hexdump $sp+0x10
    hexdump $sp
    printf "\n"

    if ($SHOW_COLOR)
        echo \033[37m
    end
    printf "[%04X:%08X]--------------------", $cs, $eip
    printf "--------------------------------------[code]\n"
    if ($SHOW_COLOR)
        echo \033[0m
    end

    # Show code
    x/8i $pc
    printf "\n"

    # Show data
    datawin
    printf "\n"

    if ($SHOW_COLOR)
        echo \033[37m
    end
    printf "----------------------------------------"
    printf "---------------------------------------\n"
    if ($SHOW_COLOR)
        echo \033[0m
    end
end
document context
    Print regs stack ds:esi and disassemble cs:eip
end

# Calls "context" at every breakpoint
define hook-stop
    if ($SHOW_CONTEXT)
        context
    end
end
