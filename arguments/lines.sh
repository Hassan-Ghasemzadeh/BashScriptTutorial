#!/bin/bash

lines=$(ls -lh | wc -l)
if [ $# -ne 1 ]
then
    echo "This script requires exactly one directory path passed to it."
    echo "Please try again"
    exit 1
fi

echo "You have $(($lines-1)) object in $1 directory"