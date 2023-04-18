#!/bin/bash

BACKUP_DIR="/mnt/c/Users/ml4nets/Documents/docker-volume-backup"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

# Backup (and compress) each volume
# for volume_name in $(sudo docker volume ls --quiet); do
#     echo "Backing up volume $volume_name ..."
#     sudo docker run --rm \
#         -v "$volume_name":/source \
#         -v "$BACKUP_DIR":/backup \
#         alpine tar -czvf "/backup/$volume_name.tar.gz" -C /source .
# done

# Backup (without compressing) each volume
for volume_name in $(sudo docker volume ls --quiet); do
    echo "Backing up volume $volume_name ..."
    sudo docker run --rm \
        -v "$volume_name":/source \
        -v "$BACKUP_DIR":/backup \
        alpine tar -cvf "/backup/$volume_name.tar" -C /source .
done

echo "All volumes backed up to $BACKUP_DIR"
