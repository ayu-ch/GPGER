#!/bin/bash

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
    
    elif [ $sign != 'no' || $sign != 'yes' ]
    then
      sign
    fi
}

list(){
  (printf '\n%s\n\n' "Printing all the GPG Keys") | lolcat
  gpg --list-secret-keys --keyid-format=long| lolcat
}
