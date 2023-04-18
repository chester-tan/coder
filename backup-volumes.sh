#!/bin/bash

BACKUP_DIR="/mnt/c/Users/ml4nets/Documents/docker-volume-backup"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

# Backup (and compress) each volume
# for volume_name in $(docker volume ls --quiet); do
#     echo "Backing up volume $volume_name ..."
#     docker run --rm \
#         -v "$volume_name":/source \
#         -v "$BACKUP_DIR":/backup \
#         alpine sh -c "apk add --no-cache pv && \
#         tar -c -C /source . | pv | gzip > /backup/$volume_name.tar.gz"
# done

# # Backup (without compressing) each volume
for volume_name in $(docker volume ls --quiet); do
    echo "Backing up volume $volume_name ..."
    docker run --rm \
        -v "$volume_name":/source \
        -v "$BACKUP_DIR":/backup \
        alpine sh -c "apk add --no-cache pv && \
        tar -c -C /source . | pv > /backup/$volume_name.tar"
done

echo "All volumes backed up to $BACKUP_DIR"
