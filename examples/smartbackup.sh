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

log_info "Starting backup process..."

mkdir -p "$backup_path"

# to backup the source dir and zip with gzip
if tar -czf "$backup_path/$backup_name" "$source_dir" 2>/dev/null
    log_info "Backup file created successfully: $BACKUP_NAME"
else
    log_error "Error compressing files!"
fi

# find the backuped files and remove them 
if scp "$backup_path/$backup_name" "$remote_user@$remote_host:$remote_dir"
    log_info "The transfer was successful."
else
    log_error "Error transferring file! Check network connection or SSH access."
fi

log_info "Cleaning up old archives..."

find "$BACKUP_PATH" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

log_info "The operation was completed successfully."