#!/bin/bash

# we use && because we want to say that if first one is successfull then do second
# you can use ; to say that if first one is success or it fails do second one
# using | for this is not correct because it takes result of first one and
# sends it to second one but second one doesn't need that

command = /development/flutter/bin
if [ -f command ]
then
    echo "Flutter does not exists"
else
    echo "Flutter exists we will check update for you ..."
    flutter doctor && flutter upgrade
fi