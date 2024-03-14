#!/bin/bash

source display.sh
source menu.sh

if ! command -v lolcat &> /dev/null
then
    echo "Please install lolcat on your machine"
    exit
fi

if ! command -v gpg &> /dev/null
then
    echo "Please install gnupg on your machine"
    exit
fi

looper=true

while [ "$looper" ];
do
    menu
done