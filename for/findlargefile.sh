#!/bin/bash

command="ls -lha $HOME"
$command | while read -r line
do
    if [[ $line == *"M"* ]];then
        echo "Found large file: $line"
    fi
done