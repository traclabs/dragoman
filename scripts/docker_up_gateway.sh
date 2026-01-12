#!/usr/bin/env bash

# echo "Stopping and removing any existing gateway containers..."
# env UID=${UID} docker compose -f demos/gateway/docker-compose.yml down

echo "Starting gateway services..."
env UID=${UID} docker compose -f demos/gateway/docker-compose.yml up
