#!/usr/bin/env bash

basic_conky() {
    rm -f $HOME/.conkyrc
    ln -s $HERE/conky/conky_manjaro $HOME/.conkyrc
}

basic_tilda() {
    (
        cd $HOME/.config
        rm -rf tilda
        ln -s $HERE/tilda
    )
}

configs_menu() {
    cd
    clear
    echo "This will overwrite existing configs, make sure to back"
    echo "them up first!"
    echo
    echo " a: All"
    echo " 1: conky (not included in All)"
    echo " 2: ctags"
    echo " 3: dunst"
    echo " 4: gdb"
    echo " 5: git"
    echo " 6: htop"
    echo " 7: less"
    echo " 8: mutt"
    echo " 9: muttator (not included in All)"
    echo "10: openbox"
    echo "11: ranger"
    echo "12: rofi"
    echo "13: terminator"
    echo "14: tilda (not included in All)"
    echo "15: tint2"
    echo "16: top"
    echo "17: w3m"
    echo "18: x11"
    echo "19: vimperator (not included in All)"
    echo " q: Quit"
    echo
    read -p "Select an option to continue: " option
    case "$option" in
        "a")
            ctags_configs
            dunst_configs
            gdb_configs
            git_configs
            htop_configs
            less_configs
            mutt_configs
            openbox_configs
            ranger_configs
            rofi_configs
            terminator_configs
            tint2_configs
            top_configs
            w3m_configs
            x11_configs
            ;;
        "1") conky_menu ;;
        "2") ctags_configs ;;
        "3") dunst_configs ;;
        "4") gdb_configs ;;
        "5") git_configs ;;
        "6") htop_configs ;;
        "7") less_configs ;;
        "8") mutt_configs ;;
        "9") muttator_configs ;;
        "10") openbox_configs ;;
        "11") ranger_configs ;;
        "12") rofi_configs ;;
        "13") terminator_configs ;;
        "14") tilda_menu ;;
        "15") tint2_configs ;;
        "16") top_configs ;;
        "17") w3m_configs ;;
        "18") x11_configs ;;
        "19") vimperator_configs ;;
        "q") exit ;;
        *) ;;
    esac
    configs_menu
}

conky_menu() {
    cd
    clear
    echo
    echo "1: Manjaro"
    echo "2: Standard"
    echo "3: Grey"
    echo "m: Configs menu"
    echo "q: Quit"
    echo
    read -p "Select an option to continue: " option
    case "$option" in
        "1") basic_conky ;;
        "2") manjaro_conky ;;
        "3") gray_conky ;;
        "m") configs_menu ;;
        "q") exit ;;
        *) conky_menu ;;
    esac
    configs_menu
}

ctags_configs() {
    rm -f $HOME/.ctags
    ln -s $HERE/ctags $HOME/.ctags
}

dunst_configs() {
    (
        cd $HOME/.config
        rm -rf dunst
        ln -s $HERE/dunst
    )
}

gdb_configs() {
    rm -rf $HOME/.gdb $HOME/.gdbinit
    ln -s $HERE/gdb $HOME/.gdb
    ln -s $HOME/.gdb/gdbinit $HOME/.gdbinit
}

git_configs() {
    rm -rf $HOME/.cvsignore $HOME/.gitconfig $HOME/.gitattributes
    ln -s $HERE/git/cvsignore $HOME/.cvsignore
    ln -s $HERE/git/gitconfig $HOME/.gitconfig
    ln -s $HERE/git/gitattributes $HOME/.gitattributes

    mkdir -p $HOME/.git
    (
        cd $HOME/.git
        rm -rf hooks
        ln -s $HERE/git/hooks
    )
}

gray_conky() {
    rm -rf $HOME/.conkyrc
    ln -s $HERE/conky/conkyrc.gray $HOME/.conkyrc
}

htop_configs() {
    (
        cd $HOME/.config
        rm -rf htop
        ln -s $HERE/htop
    )
}

kali_tilda() {
    (
        cd $HOME/.config
        rm -rf tilda
        ln -s $HERE/tilda_kali tilda
    )
}

less_configs() {
    (
        cd $HOME/.config
        rm -rf less
        ln -s $HERE/less
    )
}

manjaro_conky() {
    rm -f $HOME/.conkyrc
    ln -s $HERE/conky/conkyrc $HOME/.conkyrc
}

mutt_configs() {
    rm -rf $HOME/.mutt $HOME/.muttrc
    ln -s $HERE/mutt $HOME/.mutt
}

muttator_configs() {
    rm -f $HOME/.muttatorrc
    ln -s $HERE/muttator/muttatorrc $HOME/.muttatorrc
}

openbox_configs() {
    (
        cd $HOME/.config
        rm -rf openbox
        ln -s $HERE/openbox
    )
}

ranger_configs() {
    (
        cd $HOME/.config
        rm -rf ranger
        ln -s $HERE/ranger
    )
}

rofi_configs() {
    (
        cd $HOME/.config
        rm -rf rofi
        ln -s $HERE/rofi
    )
}

terminator_configs() {
    (
        cd $HOME/.config
        rm -rf terminator
        ln -s $HERE/terminator
    )
}

tilda_menu() {
    clear
    echo
    echo "1: Tilda"
    echo "2: Tilda for kali"
    echo "m: Configs menu"
    echo "q: Quit"
    echo
    read -p "Select an option to continue: " option
    case "$option" in
        "1") basic_tilda ;;
        "2") kali_tilda ;;
        "m") configs_menu ;;
        "q") exit ;;
        *) tilda_menu ;;
    esac
    configs_menu
}

tint2_configs() {
    (
        cd $HOME/.config
        rm -rf tint2
        ln -s $HERE/tint2

        cd tint2
        rm -f tint2rc
        ln -s aero_trans.conf tint2rc
    )
}

top_configs() {
    rm -f $HOME/.toprc
    ln -s $HERE/top/toprc $HOME/.toprc
}

usage() {
    echo "Usage: ${0/*\//} [OPTIONS]"
    echo "Options:"
    echo "    -h, --help"
    echo "        Display this help message"
    echo
    exit $1
}

vimperator_configs() {
    rm -f $HOME/.vimperatorrc
    ln -s $HERE/vimperator/vimperatorrc $HOME/.vimperatorrc
}

w3m_configs() {
    rm -rf $HOME/.w3m
    ln -s $HERE/w3m $HOME/.w3m
}

x11_configs() {
    rm -f $HOME/.Xresources $HOME/.xscreensaver
    ln -s $HERE/Xresources $HOME/.Xresources
    ln -s $HERE/xscreensaver $HOME/.xscreensaver
}

declare -a args
HERE="$(pwd)"

while [[ $# -gt 0 ]]; do
    case "$1" in
        "--") shift && args+=("$@") && break ;;
        "-h"|"--help") usage 0 ;;
        *) args+=("$1") ;;
    esac
    shift
done
[[ -z ${args[@]} ]] || set -- "${args[@]}"

[[ $# -eq 0 ]] || usage 1

mkdir -p $HOME/.config

configs_menu
