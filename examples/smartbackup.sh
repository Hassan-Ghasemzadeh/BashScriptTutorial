#!/bin/bash

source_dir="/user/home/my_project"
backup_path="/tmp/backups"
remote_user="admin"
remote_host="192.168.1.50"
remote_dir="/backup/storage"
timestamp="$(date +%Y-%m-%d %H:%M:S)"
backup_name="project_backup_$timestamp.tar.gz"

# This function will echo the message and color it header in green
# 32m=green,31m=red,33m=yellow,34m=blue,35m=purple,36m=cyan,37m=white,0m=default

log_info() { 
    echo -e "\e[32m[INFO]\e[0m $1" 
}

log_error(){
    echo -e "\e[31m[ERROR]\e[0m $1"
}