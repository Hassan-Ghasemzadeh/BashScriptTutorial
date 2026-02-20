#!/bin/bash

#setting
THRESHOLD=80
LOG_DIR="/var/log/logmaster"
BACKUP_DIR="/tmp/archive_logs"
REPORT_FILE="/var/log/cleanup_report.log"

#creates backup directory if not exists
mkdir -p "$BACKUP_DIR"

echo "Start of maintenance operations in $(date)" >> "$REPORT_FILE"

current_usage=$( df / | grep / | awk "${print $5}" / sed "s/%//" )
if [ $current_usage -gt $THRESHOLD ]
then



else
    echo "Disk status is normal ($CURRENT_USAGE%). No cleanup needed." >> "$REPORT_FILE"
fi
echo "maintenance done..." >> "$REPORT_FILE"