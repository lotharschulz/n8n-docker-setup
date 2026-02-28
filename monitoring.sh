#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Check the n8n application version inside the container
docker exec n8n n8n --version || echo "Warning: could not check n8n version (container may not be running)."

# View logs
docker logs n8n || echo "Warning: could not check n8n version (container may not be running)."

# Follow logs in real-time
docker logs -f n8n || echo "Warning: could not check n8n version (container may not be running)."
