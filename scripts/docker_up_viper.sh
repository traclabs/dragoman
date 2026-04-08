#!/usr/bin/env bash

echo "Starting viper services..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

env UID=${UID} docker compose -f "${PROJECT_ROOT}/demos/viper/docker-compose.yml" down
docker network rm lunar_exploration_spaceip || true
env UID=${UID} docker compose -f "${PROJECT_ROOT}/demos/viper/docker-compose.yml" up
