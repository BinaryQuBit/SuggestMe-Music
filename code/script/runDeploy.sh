#!/bin/bash

set -e

ROOT_DIR="../"

echo "Going into Root"
cd "$ROOT_DIR"

echo "Building Docker Compose File..."
docker-compose build

echo "Loging in to Docker"
docker login

echo "Tagging Image"
docker tag code-suggestmemusic binaryqubit/suggestmemusic:latest

echo "Pushing Image"
docker push binaryqubit/suggestmemusic:latest

echo "Deleting Images"
docker rmi -f $(docker images -q)