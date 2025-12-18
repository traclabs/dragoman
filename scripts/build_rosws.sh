#!/usr/bin/env bash

echo ""
echo "##### Building rosws #####"
echo ""

COMPOSE_FILE="docker-compose-combined.yml"
docker compose -f ${COMPOSE_FILE} build rosws

echo ""
echo "##### Done! #####"
exit 0
