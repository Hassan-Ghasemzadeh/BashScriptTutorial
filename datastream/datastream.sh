#!/bin/bash


release_file=/etc/os-release
log_file=/var/log/updater.log
error_log=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then
    #host is based on arch linux.
    sudo packman -Syu 1>>$log_file 2>>$error_log
    if [ $? -ne 0 ]
    then
        echo "An error accured. please check $error_log file"
    fi
fi
if grep -q "Pop" $release_file || grep -q "Ubuntu" $release_file
then
    #the host is based on ubuntu
    #run the apt version of the command
    sudo apt update 1>>$log_file 2>>$error_log
    if [ $? -ne 0 ]
    then
        echo "An error accured. please check $error_log file"
    fi
    sudo apt dist-upgrade -y 1>>$log_file 2>>$error_log
    if [ $? -ne 0 ]
    then
        echo "An error accured. please check $error_log file"
    fi
fi