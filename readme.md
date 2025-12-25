# n8n Docker Setup Scripts

Simple bash scripts to run n8n in Docker with persistent data storage.

## Prerequisites

- Docker installed and running
- Linux system with `timedatectl` (for timezone detection)

## Setup

Create three files with the contents below and make them executable:
```bash
chmod +x setup.sh monitoring.sh teardown.sh
```

## Usage

### Setup and Start n8n
```bash
./setup.sh
```

This will:
- Detect your system timezone automatically
- Create a Docker volume `n8n_data` for persistent storage
- Start n8n in detached mode on port 5678

Access n8n at: http://localhost:5678

### Monitor Logs
```bash
./monitoring.sh
```

This will show recent logs and then follow them in real-time (Ctrl+C to exit).

### Teardown
```bash
./teardown.sh
```

This will:
- Stop the n8n container
- Optionally remove the Docker image (saves disk space)
- Optionally remove the data volume (⚠️ deletes all workflows and data)

## Data Persistence

Your n8n workflows, credentials, and settings are stored in the `n8n_data` Docker volume. This data persists even when the container is stopped or removed, allowing you to safely restart n8n without losing your work.

## Notes

- The container runs with `--rm` flag, so it's automatically removed when stopped
- Your data remains safe in the `n8n_data` volume
- To completely reset n8n, run teardown and remove both the image and volume

## Files

- `setup.sh` - Creates volume and starts n8n container
- `monitoring.sh` - Views and follows container logs
- `teardown.sh` - Stops container and optionally removes image/volume

## References

- [https://docs.n8n.io/hosting/installation/docker/#starting-n8n](https://docs.n8n.io/hosting/installation/docker/#starting-n8n)