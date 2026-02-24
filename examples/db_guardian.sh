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