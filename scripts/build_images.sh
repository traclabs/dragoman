#!/usr/bin/env bash

echo "==============================================="
echo "Building Docker Images"
echo "==============================================="
echo ""

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

echo ">>> Building Viper images..."
"${SCRIPT_DIR}/build_images_viper.sh"

echo ""
echo ">>> Building Gateway images..."
"${SCRIPT_DIR}/build_images_gateway.sh"

echo ""
echo "==============================================="
echo "✓ All images built successfully!"
echo "==============================================="

