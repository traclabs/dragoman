#!/usr/bin/env bash

# TODO: In the near future, building images will be necessary.
# For now, we don't have rosws or other dependencies in the docker-compose.yml,
# so the only images we use are pulled from the internet.
echo "Building Viper images..."
echo "(Note: No output expected - docker-compose.yml uses pre-built images)"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

env UID=${UID} docker compose -f "${PROJECT_ROOT}/demos/viper/docker-compose.yml" build

