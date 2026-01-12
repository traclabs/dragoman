#!/usr/bin/env bash

# echo "Stopping and removing any existing viper containers..."
# env UID=${UID} docker compose -f demos/viper/docker-compose.yml down
# docker rm -f isaac-sim 2>/dev/null || true

echo "Starting viper services..."
env UID=${UID} docker compose -f demos/viper/docker-compose.yml up
