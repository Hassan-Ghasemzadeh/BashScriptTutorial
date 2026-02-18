#!/bin/bash

# Redirection: > /dev/null 2>&1 
# Suppresses all output (both standard output and error messages).
# It ensures the script remains silent and only shows our custom echo messages.

directory=/notexists

if [ -d "$directory" ] > /dev/null 2>&1
then
    echo "directory exists"
else
    echo "directory does not exists"
fi

echo "Script finished with exit code $?"