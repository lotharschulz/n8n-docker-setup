#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Stop the container
echo "Stopping n8n container..."
docker stop n8n 2>/dev/null || echo "Container 'n8n' not running or already stopped."

# Remove the Docker image
read -p "Do you want to remove the n8n Docker image? This will delete only the Docker image. (y/N): " confirm
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    docker rmi docker.n8n.io/n8nio/n8n
    echo "n8n Docker image removed."
else
    echo "n8n Docker image retained."
fi


# Optionally, remove the Docker volume
read -p "Do you want to remove the n8n_data Docker volume? This will delete all your n8n data. (y/N): " confirm
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    docker volume rm n8n_data
    echo "n8n_data Docker volume removed."
else
    echo "n8n_data Docker volume retained."
fi