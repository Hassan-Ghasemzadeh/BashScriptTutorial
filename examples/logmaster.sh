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
    echo "Warning: Disk usage exceeded limit ($CURRENT_USAGE%)" >> "$REPORT_FILE"

    find "$LOG_DIR" -type f -name "*.log" -size +50M | while read -r file; do
        FILENAME=$(basename "$file")
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        
        echo "در حال فشرده‌سازی: $FILENAME" >> "$REPORT_FILE"
        
        # Archive and empty the original file (without deleting the file to avoid service errors)
        tar -czf "$BACKUP_DIR/${FILENAME}_${TIMESTAMP}.tar.gz" "$file"
        truncate -s 0 "$file"
        
        echo "فایل $FILENAME با موفقیت آرشیو و پاکسازی شد." >> "$REPORT_FILE"
    done    

else
    echo "Disk status is normal ($CURRENT_USAGE%). No cleanup needed." >> "$REPORT_FILE"
fi
echo "maintenance done..." >> "$REPORT_FILE"