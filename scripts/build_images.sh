#!/usr/bin/env bash

echo "==============================================="
echo "Building Docker Images"
echo "==============================================="
echo ""

echo ">>> Building Viper images..."
./scripts/build_images_viper.sh

echo ""
echo ">>> Building Gateway images..."
./scripts/build_images_gateway.sh

echo ""
echo "==============================================="
echo "✓ All images built successfully!"
echo "==============================================="

