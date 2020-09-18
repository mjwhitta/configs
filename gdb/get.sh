#!/usr/bin/env bash

case "$1" in
    "gef") git clone https://github.com/hugsy/gef.git ;;
    "peda") git clone https://github.com/longld/peda.git ;;
    "pwndbg")
        git clone https://github.com/pwndbg/pwndbg.git
        git -C pwndbg submodule update --init --recursive
        pip install -r pwndbg/requirements.txt
        ;;
esac
