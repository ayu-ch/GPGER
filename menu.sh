#!/bin/bash
source display.sh
sign(){
    (printf '\n%s\n' "Do you want to set it as your signing key?(yes/no)")
    read sign
    if [ $sign ==  'yes' ]
    then
      keyId=$(gpg --list-secret-keys --keyid-format=long | awk '$1 ~ /sec/ {print $2}' | awk -F "/" '{print $2}' | head -1)
      git config --global user.signingkey $keyId
      git config --global commit.gpgsign true
      (gpg --armor --export $key) | lolcat
      (printf '\n%s\n\n' "================Add the above key to github===================") | lolcat
    
    elif [ $sign == 'no' ]
    then
      continue
    else  
      sign
    fi
}

list(){
  (printf '\n%s\n\n' "Printing all the GPG Keys") | lolcat
  gpg --list-secret-keys --keyid-format=long| lolcat
}

menu() {
display

  read input
  if [ $input == 1 ]
  then
    printf '\n'
    gpg --full-generate-key
    sign
    menu
  elif [ $input == 2 ]
  then 
    list
    menu
  elif [ $input == 3 ]
  then 
    list
    (printf '\n%s\n' "Which key do you want to delete (Enter 1/2/3/...)") | lolcat
    read num
    keyId=$(gpg --list-secret-keys --keyid-format=long | awk '$1 ~ /sec/ {print $2}' | awk -F "/" '{print $2}' | sed -n "${num}p")  
	  gpg --delete-secret-key $(echo $keyId)
	  gpg --delete-key $(echo $keyId)
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