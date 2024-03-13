#!/bin/bash

display() {
(echo "  __________________  __________________ "
 echo " /  _____/\______   \/  _____/\______   \""
 echo "/   \  ___ |     ___/   \  ___ |       _/"
 echo "\    \_\  \|    |   \    \_\  \|    |   \ "
 echo " \______  /|____|    \______  /|____|_  /"
 echo "        \/                  \/        \/ ") |lolcat
 (printf '\n%s\n\n' ============================================
 echo "                 WELCOME                  "
 printf '\n%s\n\n' ============================================) | lolcat
 (echo "      WHAT WOULD YOU LIKE TO DO TODAY?      "
 printf '\n%s\n' "1) Create a new GPG Key "
 printf '\n%s\n' "2) View your existing GPG Keys"
 printf '\n%s\n' "3) Delete an existing GPG Key"
 printf '\n%s\n' "4) Exit"
 printf '\n%s\n\n' ============================================) | lolcat
}