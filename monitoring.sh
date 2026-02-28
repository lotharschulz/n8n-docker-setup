#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Check the docker image version
docker exec n8n n8n --version || echo "Warning: could not check n8n version (container may not be running). Continuing..."

# View logs
docker logs n8n

# Follow logs in real-time
docker logs -f n8n
