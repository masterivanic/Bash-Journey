#!/bin/bash

# Settings
WEB_SERVER="https://example.com"
BACKUP_DIR="/backup"
TARGET_DIRS="/var/www /etc"
DISK_USAGE_THRESHOLD=90
ADMIN_EMAIL="admin@example.com"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"

# Check web server availability
echo "Checking web server availability..."
if curl -s --head $WEB_SERVER | grep "200 OK" > /dev/null; then
    echo "Web server is available."
else
    echo "Warning: Web server is unavailable!" | mail -s "Web server issue" $ADMIN_EMAIL
fi

# Check disk space
echo "Checking disk space..."
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ $DISK_USAGE -gt $DISK_USAGE_THRESHOLD ]; then
    echo "Warning: Disk usage has exceeded $DISK_USAGE_THRESHOLD%!" | mail -s "Disk space issue" $ADMIN_EMAIL
else
    echo "Sufficient disk space available."
fi

# Create backup
echo "Creating backup..."
tar -czf $BACKUP_FILE $TARGET_DIRS

if [ $? -eq 0 ]; then
    echo "Backup successfully created: $BACKUP_FILE"
else
    echo "Backup creation error!" | mail -s "Backup creation error" $ADMIN_EMAIL
fi

# Send report
echo "Sending report to $ADMIN_EMAIL..."
REPORT="Report for $DATE\n\n"
REPORT+="Web server status: $(curl -s --head $WEB_SERVER | head -n 1)\n"
REPORT+="Disk space usage: $DISK_USAGE%\n"
REPORT+="Backup location: $BACKUP_FILE\n"

echo -e $REPORT | mail -s "Daily system report" $ADMIN_EMAIL

echo "Done."