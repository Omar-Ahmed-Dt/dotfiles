#!/bin/bash
set -e

UPLOAD_LOCATION="/home/omar/home_docker/immich/library"
SSD_MOUNT="/mnt/myssd"
EXTERNAL_BACKUP="$SSD_MOUNT/immich"
BORG_REPO="$EXTERNAL_BACKUP/immich-borg"
DB_BACKUP_DIR="$EXTERNAL_BACKUP/db_backup"
DB_USER="postgres"

# Backup database
docker exec -t immich_postgres pg_dumpall \
  --clean --if-exists --username="$DB_USER" \
  > "$DB_BACKUP_DIR/immich-database.sql"

# Create Borg snapshot
borg create "$BORG_REPO::{now}" \
  "$UPLOAD_LOCATION" \
  "$DB_BACKUP_DIR" \
  --exclude "$UPLOAD_LOCATION/thumbs/" \
  --exclude "$UPLOAD_LOCATION/encoded-video/"

# Retention policy (optional)
borg prune --keep-weekly=4 --keep-monthly=3 "$BORG_REPO"
borg compact "$BORG_REPO"

echo "Immich backup completed successfully."
