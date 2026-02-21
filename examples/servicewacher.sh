#!/bin/bash

url="https://www.google.com"
service="nginx"
log_file="/var/log/serice_watcher.log"

log_message(){
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

echo "Start system inspection..."

http_response=$(curl -s -o /var/null -I -w "%{http_code}" "$url")
if[ $http_response -eq 200 ]
then
    log_message "The website is available (status 200)."
else
    log_message "There is a problem with the website $url"
fi
