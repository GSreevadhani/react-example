#!/bin/bash

echo "Starting deployment..."

# Give execution permission to build.sh (if necessary)
chmod +x build.sh

# Run build.sh (Ensure it builds your React project)
./build.sh

# Login to Docker Hub (Use a secure method instead of hardcoding credentials)
echo "Logging into Docker..."
echo "${DOCKER_PASSWORD}" | docker login -u ar8888 --password-stdin

# Build the Docker image
echo "Building the Docker image..."
docker build -t my-react-app .

# Tag the image for Docker Hub
docker tag my-react-app ar8888/my-react-app:latest

# Push the image to Docker Hub
echo "Pushing the image to Docker Hub..."
docker push ar8888/my-react-app:latest

echo "Deployment complete!"
