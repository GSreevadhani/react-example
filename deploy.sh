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
docker tag test sreevadhani/ar
docker push sreevadhani/ar
if [ $? -ne 0 ]; then
    echo "❌ Docker push failed!"
    exit 1
fi
