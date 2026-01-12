#!/usr/bin/env bash

echo "Starting viper services..."
env UID=${UID} docker compose -f demos/viper/docker-compose.yml up
