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

grep "Failed password" "$auth_log" | \
awk '{
    if(i=1;i<=NF;i++){
        if($i ~ /^[0-9]+\.[0-9]+\.+[0-9]\.+[0-9]+$/) print $i
    }
}
' | \
sort | uniq -c | sort -nr | \
awk -v limit="$threshold" '$i > limit { print "IP: " $2 " | Number of failed try $1 }' >> "$report"

if [[ -s "$auth_log" ]]
then
    echo "[!] Potential threats detected. See report in $REPORT:"
    cat "$report"
else
    echo "No suspicious items were found."
fi