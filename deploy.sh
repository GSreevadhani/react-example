#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh

# Login to DockerHub and check for success
echo "$DOCKER_PASSWORD" | docker login -u "sreevadhani" --password-stdin
if [ $? -ne 0 ]; then
    echo "❌ Docker login failed!"
    exit 1
fi

# Tag and push the image
# Tagging the built image with the correct name before pushing
docker tag react-app sreevadhani/app

# Pushing the tagged image to Docker Hub
docker push sreevadhani/app

if [ $? -ne 0 ]; then
    echo "❌ Docker push failed!"
    exit 1
fi
