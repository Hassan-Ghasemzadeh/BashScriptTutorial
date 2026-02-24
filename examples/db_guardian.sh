#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

readonly BACKUP_DIR="/var/backup/db_backups"
readonly LOG_FILE="/var/log/db_guardian.log"
DB_NAME=""
DB_USER="Root"

usage(){
    echo "Usage: $0 -d <database_name> [-u <database_user>]"
    echo "-d: (required) Name of the database to backup "
    echo "-u: (optional) Database user (default:Root)"
}

log_msg(){
    $local=$1
    $message=$2
    echo "$(date '+%Y-%m-%d %H:%M:%S') -[\e[34m$local\e[0m]-$message"
}

check_dependencies(){
    local deps=("mysqldump" "gzip" "mysql")
    for tool in "${deps[@]}"
    do
        if ! command -v "$tool" &> /dev/null
        then
            log_msg "ERROR" "Dependency '$tool' is not installed. Please install it and try again."
            exit 1
        fi
    done
}

run_backup(){
    local timestamp=$(date +%Y-%m-%d %H:%M:%S)
    local backup_file="$BACKUP_DIR/${DB_NAME}_backup_$timestamp.sql.gz"
    mkdir -p "$BACKUP_DIR"
    log_msg "INFO" "Starting backup for database '$DB_NAME' at $timestamp"
    if mysqldump -u "$DB_USER" -p --databases "$DB_NAME" | gzip > "$backup_file"
    then
        log_msg "INFO" "Backup successful: $backup_file"
    else
        log_msg "ERROR" "Backup failed for database '$DB_NAME'"
        exit 1
    fi
}
