#!/bin/bash

echo "Starting deployment..."

# Run build.sh (which builds the Docker image)
./build.sh

# Login to Docker Hub securely
echo "Logging into Docker..."
echo "${DOCKER_PASSWORD}" | docker login -u ar8888 --password-stdin

# Tag the built image
echo "Tagging the image..."
docker tag test ar8888/my-react-app:latest

# Push the image to Docker Hub
echo "Pushing the image to Docker Hub..."
docker push ar8888/my-react-app:latest

echo "Deployment complete!"
