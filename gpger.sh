#!/bin/bash

source display.sh
source menu.sh

if ! command -v lolcat &> /dev/null
then
    
    sudo apt-get update
    sudo apt-get install lolcat
fi

if ! command -v gpg &> /dev/null
then
    sudo apt-get update
    sudo apt-get install gnupg
fi

menu
