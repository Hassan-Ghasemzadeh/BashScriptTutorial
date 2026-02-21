#!/bin/bash

#setting up the environment variables
auth_log="/var/log/secure"
threshold=5
report="/tmp/failed_login_report.txt"

echo "Security check report ($(date))" >> "$report"

if[[ ! -f "$auth_log" ]]
then
    echo "$auth_log is unavailable.Do you have root access?"
    exit 1
fi


