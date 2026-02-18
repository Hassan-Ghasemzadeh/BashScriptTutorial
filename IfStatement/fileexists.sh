#!/bin/bash

# -e (Exists) -f (Regular File) -d (Directory)

if [ -f ~/myfile.txt ]
then
    echo "File exists"
else
    echo "File does not exist"
fi

if [ -d ~/VscodeProject ]
then
    echo "Directory exists"
else
    echo "Directory does not exist"
fi

if [ -e ~/m.txt ]
then
    echo "File exists"
else
    echo "File does not exist"
fi