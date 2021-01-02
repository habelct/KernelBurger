#!/bin/bash

# Define variables
LSB=/usr/bin/lsb_release

# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
        local message="$@"
        [ -z $message ] && message="Press [Enter] key to continue..."
        read -p "$message" readEnterKey
}
# Purpose  - Display a menu on screen
function show_menu(){
    date
    echo "---------------------------"
    echo "   MAIN MENU"
    echo "---------------------------"
        echo "1. Capture Flip Video"
        echo "2. Exit"
}

# Purpose - Display header message
# $1 - message
function write_header(){
        local h="$@"
        echo "---------------------------------------------------------------"
        echo "     ${h}"
        echo "---------------------------------------------------------------"
}

# Purpose - Get info about your operating system
function capture_flip_video(){
        write_header " Capture Video"
        eval python3 cam.py
        eval clear
        echo "Your video is captured in output.avi"
        pause
}

function read_input(){
        local c
        read -p "Enter your choice " c
        case $c in
                1)      capture_flip_video ;;
                2)      exit 0;;
        esac
}

# ignore CTRL+Z and quit singles using the trap
#trap '' SIGINT SIGQUIT SIGTSTP

# main logic
while true
do
        clear
        show_menu       # display memu
        read_input  # wait for user input
done
