#!/bin/bash

# Get all docker volumes
volumes=$(docker volume ls -q)

# Iterate through each volume
for volume in $volumes
do
  # Create a backup folder
  mkdir -p /backups/$volume

  # Backup the volume
  docker run --rm \
    -v $volume:/data \
    -v /backups/$volume:/backup \
    alpine \
    tar cvf /backup/volume_backup.tar /data
done