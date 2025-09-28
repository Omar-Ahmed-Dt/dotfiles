#!/bin/bash
set -euo pipefail

# Configuration
SOURCE_DIR="/home/omar/"
DEST_DIR="/mnt/myssd/"
LOG_FILE="/var/log/home_backup.log"

# Rsync filter rules:
# + = include, - = exclude
# Order matters: specific includes come BEFORE broader excludes.
FILTERS=(
  # --- Documents: keep only /Documents/al ---
  # "+ /Documents/"
  # "+ /Documents/al/"
  # "+ /Documents/al/***"
  # "- /Documents/***"

  # --- Downloads: keep only /Downloads/rn ---
  # "+ /Downloads/"
  # "+ /Downloads/rn/"
  # "+ /Downloads/rn/***"
  # "- /Downloads/***"

  # Other exclusions (relative to SOURCE_DIR root)
  "- /aur/***"
  "- /github/***"
  "- /go/***"
  "- /node_modules/***"
  "- /obs/***"
  "- /VirtualBox_VMs/***"
  "- /VirtualBox VMs/***"
  "- /config_bkp/***"
  "- /icons/***"
  "- /venvs/***"
  "- /jupyterenv/***"
  "- /ios/***"

  # Exclude ALL hidden files/dirs anywhere (aggressive!)
  # Remove this if you need .config, .ssh, etc.
  "- .*/***"
)


log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Build the RSYNC_FILTERS array IN-PLACE to avoid word-splitting bugs.
build_filters() {
  RSYNC_FILTERS=()
  for rule in "${FILTERS[@]}"; do
    RSYNC_FILTERS+=( "--filter=${rule}" )
  done
}

ensure_paths() {
  # Make sure log dir exists so tee doesn't fail
  mkdir -p "$(dirname "$LOG_FILE")"
  # Optional sanity checks
  if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Source dir not found: $SOURCE_DIR" >&2
    exit 2
  fi
  if [[ ! -d "$DEST_DIR" ]]; then
    echo "Destination dir not found: $DEST_DIR" >&2
    exit 2
  fi
}

backup_home() {
  ensure_paths
  log "Starting backup of $SOURCE_DIR to $DEST_DIR"

  build_filters  # populates RSYNC_FILTERS array

  rsync -aAXv --delete \
    "${RSYNC_FILTERS[@]}" \
    "$SOURCE_DIR" "$DEST_DIR" 2>&1 | tee -a "$LOG_FILE"

  if [ ${PIPESTATUS[0]} -eq 0 ]; then
    log "Backup completed successfully."
  else
    log "Backup encountered errors."
  fi
}

restore_home() {
  ensure_paths
  log "Starting restore from $DEST_DIR to $SOURCE_DIR"

  rsync -aAXv --delete \
    "$DEST_DIR" "$SOURCE_DIR" 2>&1 | tee -a "$LOG_FILE"

  if [ ${PIPESTATUS[0]} -eq 0 ]; then
    log "Restore completed successfully."
  else
    log "Restore encountered errors."
  fi
}

dry_run_home() {
  ensure_paths
  log "Starting DRY RUN backup (no files will be copied)"

  build_filters  # populates RSYNC_FILTERS array

  rsync -aAXvn --delete \
    "${RSYNC_FILTERS[@]}" \
    "$SOURCE_DIR" "$DEST_DIR" 2>&1 | tee -a "$LOG_FILE"

  if [ ${PIPESTATUS[0]} -eq 0 ]; then
    log "Dry run completed successfully."
  else
    log "Dry run encountered errors."
  fi
}

case "${1:-}" in
  backup)   backup_home ;;
  restore)  restore_home ;;
  dry-run)  dry_run_home ;;
  *)
    echo "Usage: $0 {backup|restore|dry-run}"
    exit 1
    ;;
esac
