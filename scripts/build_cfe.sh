#!/usr/bin/env bash

echo ""
echo "##### Building cfe #####"
echo ""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
COMPOSE_FILE="${PROJECT_ROOT}/demos/gateway/docker-compose.yml"
CODE_DIR="/code"

build_cfe_code() {

  docker compose -f ${COMPOSE_FILE} run --rm -w ${CODE_DIR}/cFS fsw make SIMULATION=native prep
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "!! Failed in make SIMULATION step !!"
    return 1
  fi

  docker compose -f ${COMPOSE_FILE} run --rm -w ${CODE_DIR}/cFS fsw make
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "!! Failed in make step !!"
    return 1
  fi

  docker compose -f ${COMPOSE_FILE} run --rm -w ${CODE_DIR}/cFS fsw make install
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "!! Failed in make install step !!"
    return 1
  fi

  echo ""
  echo "##### Done! #####"
  return 0
}

build_cfe_code
