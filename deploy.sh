#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh

# Login securely
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the Docker image
docker tag test sreevadhani/ar
docker push sreevadhani/ar
