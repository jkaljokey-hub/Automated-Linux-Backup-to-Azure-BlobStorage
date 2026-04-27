#!/bin/bash
set -e

STORAGE_ACCOUNT="youraccount"
CONTAINER_NAME="backups"
RESTORE_DIR="/var/log"

echo "Available backups:"
az storage blob list \
  --account-name "$STORAGE_ACCOUNT" \
  --container-name "$CONTAINER_NAME" \
  --query "[].name" -o tsv

read -p "Enter backup file name to restore: " BACKUP_FILE

az storage blob download \
  --account-name "$STORAGE_ACCOUNT" \
  --container-name "$CONTAINER_NAME" \
  --name "$BACKUP_FILE" \
  --file "/tmp/${BACKUP_FILE}"

unzip -o "/tmp/${BACKUP_FILE}" -d "$RESTORE_DIR"

echo "Restore completed from: ${BACKUP_FILE}"
