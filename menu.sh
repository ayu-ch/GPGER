#!/bin/bash
source display.sh
source utils.sh

menu() {
display

  read input
  if [ $input == 1 ]
  then
    printf '\n'
    gpg --full-generate-key
    sign
  elif [ $input == 2 ]
  then 
    list
  elif [ $input == 3 ]
  then 
    list
    (printf '\n%s\n' "Which key do you want to delete (Enter 1/2/3/...)") | lolcat
    read num
    keyId=$(gpg --list-secret-keys --keyid-format=long | awk '$1 ~ /sec/ {print $2}' | awk -F "/" '{print $2}' | sed -n "${num}p")  
	  gpg --delete-secret-key $(echo $keyId)
	  gpg --delete-key $(echo $keyId)
  elif [ $input == 4 ]
  then 
    (printf '\n%s\n' "SEE YOU AGAIN!!!" )| lolcat
    exit
  else 
    printf '\n%s\n' 'Invalid Input!'
  fi
}