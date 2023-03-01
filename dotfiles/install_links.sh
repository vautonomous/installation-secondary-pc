#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

create_symlink_if_not_exists() {
    PATH_SRC=$1
    PATH_DST=$2
    echo "Attempting to create symlink from $PATH_SRC to $PATH_DST"
    if [ ! -f $PATH_DST ] && [ ! -d $PATH_DST ]; then
        echo "Creating..."
        ln -s $PATH_SRC $PATH_DST
    else
        echo "File/Directory found at $PATH_DST"
        echo "Won't do anything."
    fi
    echo ""
}

create_symlink_if_not_exists "$SCRIPT_DIR/.bash_aliases" "/home/nuc/.bash_aliases"

create_symlink_if_not_exists "$SCRIPT_DIR/.bashrc" "/home/nuc/.bashrc"

create_symlink_if_not_exists "$SCRIPT_DIR/.i3blocks.conf" "/home/nuc/.i3blocks.conf"

create_symlink_if_not_exists "$SCRIPT_DIR/.config/dunst" "/home/nuc/.config/dunst"

create_symlink_if_not_exists "$SCRIPT_DIR/.config/i3" "/home/nuc/.config/i3"

create_symlink_if_not_exists "$SCRIPT_DIR/.config/rofi" "/home/nuc/.config/rofi"

create_symlink_if_not_exists "$SCRIPT_DIR/cyclonedds.xml" "/home/nuc/cyclonedds.xml"
