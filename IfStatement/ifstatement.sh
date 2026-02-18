#!/bin/bash

# This script demonstrates the use of an if statement to check if a variable equals a specific value.
# you can use -eq to check if is equal to a value, -ne for not equal, -gt for greater than, -lt for less than,
# -ge for greater than or equal to, and -le for less than or equal to.

number=250
if [ "$number" -eq 250 ] 
then
    echo "The condition is true"
else
    echo "Variable is not equal to 250"
fi