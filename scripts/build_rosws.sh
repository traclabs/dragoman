#!/usr/bin/env bash

echo ""
echo "##### Building rosws #####"
echo ""

COMPOSE_FILE="docker-compose.yml"
docker compose -f ${COMPOSE_FILE} build yamcs rosfsw

echo ""
echo "##### Done! #####"
exit 0
