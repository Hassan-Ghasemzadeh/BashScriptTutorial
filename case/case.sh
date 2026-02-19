#!/bin/bash

echo "What is your Linux distribution?"

echo "1-Fedora"
echo "2-Ubuntu"
echo "3-Centos"
echo "4-Kali"
echo "5-Something else..."

read distro

case $distro in
1)
    #Fedora
    sudo dnf update
    sudo dnf upgrade
    ;;
2)
    #Ubuntu
    sudo apt update
    sudo apt upgrade
    ;;
3)
    #Centos
    sudo yum update
    sudo yum upgrade
    ;;
4)  
    #Kali
    sudo apt update
    sudo apt upgrade
    ;;
*)
    echo "Unknown Linux distribution"
    echo "Please enter valid number!"
    exit 1;
    ;;

esac