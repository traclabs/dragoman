#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

env UID=${UID} docker compose -f "${PROJECT_ROOT}/demos/gateway/docker-compose.yml" build

