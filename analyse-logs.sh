#!/bin/bash

LOG_DIR="/home/leila/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
ERROR_PATTERNS=("ERROR" "CRITICAL" "FATAL")
LOG_FILES=$(find $LOG_DIR -name "*.log")

for LOG_FILE in $LOG_FILES; do
    echo "logs that have changed in the last 24 hrs"
    echo -e "\n ${ERROR_PATTERNS[0]} logs in $LOG_FILE file"
    grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$LOG_FILE"
    grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$LOG_FILE"

    echo -e "\n ${ERROR_PATTERNS[1]} logs in $LOG_FILE file"
    grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$LOG_FILE"
    grep "${ERROR_PATTERNS[1]}" "$LOG_DIR/$LOG_FILE"

    echo -e "\n ${ERROR_PATTERNS[2]} logs in $LOG_FILE file"
    grep "${ERROR_PATTERNS[2]}" "$LOG_DIR/$LOG_FILE"
    grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$LOG_FILE"
done


