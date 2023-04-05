#!/bin/bash

BACKUP_DIR="/mnt/c/Users/ml4nets/Documents/docker-volume-backup"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

# Backup each volume
for volume_name in $(sudo docker volume ls --quiet); do
    echo "Backing up volume $volume_name ..."
    sudo docker run --rm \
        -v "$volume_name":/source \
        -v "$BACKUP_DIR":/backup \
        alpine tar -czvf "/backup/$volume_name.tar.gz" -C /source .
done

echo "All volumes backed up to $BACKUP_DIR"
