#!/usr/bin/env bash

echo "Starting mobile_servicing_system services..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

env UID=${UID} docker compose -f "${PROJECT_ROOT}/demos/mobile_servicing_system/docker-compose.yml" up
