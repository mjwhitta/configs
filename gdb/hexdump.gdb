define ascii_char
    set $_c=*(unsigned char*)($arg0)
    if (($_c < 0x20) || ($_c > 0x7E))
        printf "."
    else
        printf "%c", $_c
    end
end
document ascii_char
    Print the ASCII value of arg0 or . if value is unprintable
end

define hex_quad
    printf \
        "%02X %02X %02X %02X  %02X %02X %02X %02X", \
        *(unsigned char*)($arg0), \
        *(unsigned char*)($arg0+1), \
        *(unsigned char*)($arg0+2), \
        *(unsigned char*)($arg0+3), \
        *(unsigned char*)($arg0+4), \
        *(unsigned char*)($arg0+5), \
        *(unsigned char*)($arg0+6), \
        *(unsigned char*)($arg0+7)
end
document hex_quad
    Print eight hexadecimal bytes starting at arg0
end

define hexdump
    printf "%08X : ", $arg0
    hex_quad $arg0
    printf " - "
    hex_quad $arg0+8
    printf " "

    ascii_char $arg0
    ascii_char $arg0+1
    ascii_char $arg0+2
    ascii_char $arg0+3
    ascii_char $arg0+4
    ascii_char $arg0+5
    ascii_char $arg0+6
    ascii_char $arg0+7
    ascii_char $arg0+8
    ascii_char $arg0+9
    ascii_char $arg0+0xA
    ascii_char $arg0+0xB
    ascii_char $arg0+0xC
    ascii_char $arg0+0xD
    ascii_char $arg0+0xE
    ascii_char $arg0+0xF

    printf "\n"
end
document hexdump
    Display a 16-byte hex/ASCII dump of arg0
end

define ddump
    set $_count=0
    while ($_count < $arg0)
        set $_i=($_count*0x10)
        hexdump $data_addr+$_i
        set $_count++
    end
end
document ddump
    Display $arg0 lines of hexdump for address $data_addr
end

define dd
    if ( \
        ($arg0 & 0x40000000) || \
        ($arg0 & 0x08000000) || \
        ($arg0 & 0xBF000000) \
    )
        set $data_addr=$arg0
        ddump 0x10
    else
        printf "Invalid address: %08X\n", $arg0
    end
end
document dd
    Display 16 lines of a hex dump for $arg0
end

define hex_word
    printf \
        "%02X %02X %02X %02X", \
        *(unsigned char*)($arg0), \
        *(unsigned char*)($arg0+1), \
        *(unsigned char*)($arg0+2), \
        *(unsigned char*)($arg0+3)
end
document hex_word
    Print 4 hex bytes at given address
end

define hex_word_formatted
    printf "|---------------|\n"
    printf "|  "
    hex_word $arg0
    printf "  |"

    if ($arg0 == $esp)
        printf " <== ESP"
    end

    if ($arg0 == $ebp)
        printf " <== EBP"
    end

    if ($arg0 == ($ebp+4))
        printf " <== RET"
    end

    printf "\n"
end
document hex_word_formatted
    Print 4 hex bytes at given address with formatted border
end
