#!/bin/bash
source display.sh

menu() {
display

  read input
  if [ $input == 1 ]
  then
    printf '\n'
    gpg --full-generate-key
    keyId=$(gpg --list-secret-keys --keyid-format=long | awk '$1 ~ /sec/ {print $2}' | awk -F "/" '{print $2}' | head -1)
    git config --global user.signingkey $keyId
    git config --global commit.gpgsign true
    (gpg --armor --export $key) | lolcat
    (printf '\n%s\n\n' "====Add the above key to github=====") | lolcat
    menu
  elif [ $input == 2 ]
  then 
    (printf '\n%s\n\n' "Printing all the GPG Keys") | lolcat
    gpg --list-secret-keys --keyid-format=long| lolcat
    menu
  elif [ $input == 3 ]
  then 
    (printf '\n%s\n' "Input UserID:") | lolcat
	  read UserID
      
	  gpg --delete-secret-key $(echo $UserID)
	  gpg --delete-key $(echo $UserID)
    menu
  elif [ $input == 4 ]
  then 
    (printf '\n%s\n' "SEE YOU AGAIN!!!" )| lolcat
    exit
  else 
    printf '\n%s\n' 'Invalid Input!'
    menu
  fi
}