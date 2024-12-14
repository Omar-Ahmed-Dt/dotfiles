#!/bin/bash

# Configuration
SOURCE_DIR="/home/omar/"
DEST_DIR="/mnt"
LOG_FILE="/var/log/home_backup.log"
EXCLUDE=".cache"

# Functions
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

backup_home() {
    log "Starting backup of $SOURCE_DIR to $DEST_DIR"
    rsync -aAXv --delete --exclude="$EXCLUDE" --exclude=".*" "$SOURCE_DIR" "$DEST_DIR" 2>&1 | tee -a "$LOG_FILE"
    if [ ${PIPESTATUS[0]} -eq 0 ]; then
        log "Backup completed successfully."
    else
        log "Backup encountered errors."
    fi
}

restore_home() {
    log "Starting restore from $DEST_DIR to $SOURCE_DIR"
    rsync -aAXv --delete "$DEST_DIR" "$SOURCE_DIR" 2>&1 | tee -a "$LOG_FILE"
    if [ ${PIPESTATUS[0]} -eq 0 ]; then
        log "Restore completed successfully."
    else
        log "Restore encountered errors."
    fi
}

# Main
case "$1" in
    backup)
        backup_home
        ;;
    restore)
        restore_home
        ;;
    *)
        echo "Usage: $0 {backup|restore}"
        exit 1
        ;;
esac

