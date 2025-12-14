#!/bin/bash

LOG_DIR="/home/leila/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
ERROR_PATTERNS=("ERROR" "CRITICAL" "FATAL")
LOG_FILES=$(find $LOG_DIR -name "*.log")
REPORT_FILE="/home/leila/logs/analyse-logs-report.txt"
# Clear report ONCE
echo "Logs that have changed in the last 24 hrs" > "$REPORT_FILE"
echo "========================================" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do

    for ERROR_PATTERN in "${ERROR_PATTERNS[@]}"; do
        echo -e "\n $ERROR_PATTERN logs in $LOG_FILE file" >> "$REPORT_FILE"
        grep -c "$ERROR_PATTERN" "$LOG_FILE" >> "$REPORT_FILE"
        grep "$ERROR_PATTERN" "$LOG_FILE" >> "$REPORT_FILE"
    done
done

echo "log analysis completed and report written to $REPORT_FILE" >> "$REPORT_FILE"


