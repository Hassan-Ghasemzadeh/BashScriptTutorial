#!/bin/bash

directory=/notexists

if [ -d "$directory" ] > /dev/null 2>&1
then
    echo "directory exists"
else
    echo "directory does not exists"
fi

echo "Script finished with exit code $?"