#!/bin/bash

#setting
THRESHOLD=80
LOG_DIR="/var/log/logmaster"
BACKUP_DIR="/tmp/archive_logs"
REPORT_FILE="/var/log/cleanup_report.log"

#creates backup directory if not exists
mkdir -p "$BACKUP_DIR"