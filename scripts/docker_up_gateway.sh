#!/usr/bin/env bash

echo "Starting gateway services..."
env UID=${UID} docker compose -f demos/gateway/docker-compose.yml up
