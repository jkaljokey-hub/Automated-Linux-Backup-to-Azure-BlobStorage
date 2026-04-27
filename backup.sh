#!/bin/bash
set -e

# Config
STORAGE_ACCOUNT="youraccount"
CONTAINER_NAME="backups"
BACKUP_DIR="/var/log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup-${TIMESTAMP}.zip"

# Create archive
zip -r "/tmp/${BACKUP_FILE}" "${BACKUP_DIR}"

# Upload to Azure Blob
az storage blob upload \
  --account-name "$STORAGE_ACCOUNT" \
  --container-name "$CONTAINER_NAME" \
  --file "/tmp/${BACKUP_FILE}" \
  --name "${BACKUP_FILE}"

echo "Backup completed: ${BACKUP_FILE}"
