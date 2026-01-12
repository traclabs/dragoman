#!/usr/bin/env bash

env UID=${UID} docker compose -f demos/gateway/docker-compose.yml build

