#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# View logs
docker logs n8n

# Follow logs in real-time
docker logs -f n8n