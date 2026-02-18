#!/bin/bash

number=1
while [ $number -le 10 ]
do
    echo "number is $number"
    number=$((number + 1))
    sleep 1
done