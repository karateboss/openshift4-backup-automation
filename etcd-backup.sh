#!/bin/bash

# Define variables
REMOTE_USER="core"
REMOTE_HOST="10.0.1.40"
REMOTE_BACKUP_DIR="/home/core/backup/*"
LOCAL_BACKUP_DIR="/root/etcd-backups"

# Copy the backup files from the remote host
#scp ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_BACKUP_DIR} ${LOCAL_BACKUP_DIR}

rsync -avz --ignore-existing ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_BACKUP_DIR} ${LOCAL_BACKUP_DIR}

# Clean up old files in the local backup directory (older than 14 days)
find ${LOCAL_BACKUP_DIR} -type f -mtime +14 -exec rm {} \;
