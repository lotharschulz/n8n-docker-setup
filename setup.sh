#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

TIMEZONE=$(timedatectl show -p Timezone --value)
echo "Using timezone: $TIMEZONE"

echo "Creating Docker Volume for n8n data..."
# create Docker volume for n8n data if it doesn't exist
docker volume create n8n_data 2>/dev/null || true

echo "Starting n8n in Docker..."
docker run -d -it --rm \
 --name n8n \
 -p 5678:5678 \
 -e GENERIC_TIMEZONE="$TIMEZONE" \
 -e TZ="$TIMEZONE" \
 -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true \
 -e N8N_RUNNERS_ENABLED=true \
 -v n8n_data:/home/node/.n8n \
 docker.n8n.io/n8nio/n8n

echo "n8n is running in the background. Access it at http://localhost:5678"