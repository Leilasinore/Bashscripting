#!/bin/bash

LOG_DIR="/home/leila/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
ERROR_PATTERNS=("ERROR" "CRITICAL" "FATAL")
LOG_FILES=$(find $LOG_DIR -name "*.log")

for LOG_FILE in $LOG_FILES; do

    for ERROR_PATTERN in "${ERROR_PATTERNS[@]}"; do
        echo "logs that have changed in the last 24 hrs"
        echo -e "\n $ERROR_PATTERN logs in $LOG_FILE file"
        grep -c "$ERROR_PATTERN" "$LOG_FILE"
        grep "$ERROR_PATTERN" "$LOG_FILE"
    done
done


