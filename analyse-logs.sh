#!/bin/bash

LOG_DIR="/home/leila/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
ERROR_PATTERNS=("ERROR" "CRITICAL" "FATAL")
echo "Locating logs that have changed in the last 24 hrs"
find $LOG_DIR -name "*.log" -mtime -1

echo "${ERROR_PATTERNS[0]} logs in application.log file"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo "ERROR logs in system.log file"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$SYS_LOG_FILE"
grep "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE"
