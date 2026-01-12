#!/usr/bin/env bash

# TODO: In the near future, building images will be necessary.
# For now, we don't have rosws or other dependencies in the docker-compose.yml,
# so the only images we use are pulled from the internet.
echo "Building Viper images..."
echo "(Note: No output expected - docker-compose.yml uses pre-built images)"
env UID=${UID} docker compose -f demos/viper/docker-compose.yml build

