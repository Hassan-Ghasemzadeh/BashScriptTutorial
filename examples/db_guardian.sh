#!/usr/bin/env bash

readonly BACKUP_DIR="/var/backup/db_backups"
readonly LOG_FILE="/var/log/db_guardian.log"
DB_NAME=""
DB_USER="Root"

usage(){
    echo "Usage: $0 -d <database_name> [-u <database_user>]"
    echo "-d: (required) Name of the database to backup "
    echo "-u: (optional) Database user (default:Root)"
}