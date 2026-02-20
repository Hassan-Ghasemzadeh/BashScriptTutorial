#!/bin/bash

# check to make sure that user has entered exactly two argument
if [ $# -ne 2 ]
then
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please try again"
    exit 1
fi

#check to see if rsync is installed or not
if ! command -v rsync > /dev/null 2>&1
then
    echo "rsync should be installed"
    echo "Use your package manager to install rsync and then try again"
    exit 2
fi
