#!/bin/bash
# Script: backup_manager.sh

# --- Configuration Variables ---
# NOTE: Replace '~/documents' with the actual path you want to backup
SOURCE_DIR="/home/mohdsayeeduddin96/project/sample_data" 
# NOTE: Replace '~/backups' with a directory where backups should be stored
BACKUP_DIR="/home/mohdsayeeduddin96/project/backups" 
RETENTION_DAYS=7 # Keep backups for 7 days

# --- Setup and Execution ---

# 1. Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# 2. Define the backup file name (includes date for uniqueness)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_$TIMESTAMP.tar.gz"

echo "Starting backup of $SOURCE_DIR at $TIMESTAMP..."

# 3. Create the compressed archive using tar
# -c: create archive, -z: compress with gzip, -v: verbose output, -f: output to file
tar -czvf "$BACKUP_DIR/$BACKUP_FILE" "$SOURCE_DIR"

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "ERROR: Backup failed!"
fi

# 4. Enforce Retention Policy (Delete old files)
echo "Enforcing retention policy (deleting files older than $RETENTION_DAYS days)..."
# find: locate files older than N days and delete them
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +"$RETENTION_DAYS" -delete
echo "Retention policy complete."
