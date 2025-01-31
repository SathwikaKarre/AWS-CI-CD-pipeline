#!/bin/bash

# Variables
CONTAINER_NAME="my-container"  # Replace with your container name
IMAGE_NAME="my-image"          # Replace with your Docker image name
DOCKER_REGISTRY_URL="my-registry-url"  # Replace with your Docker registry URL
DOCKER_REGISTRY_USERNAME="my-username"  # Replace with your Docker registry username
DOCKER_REGISTRY_PASSWORD="my-password"  # Replace with your Docker registry password

# Pull the Docker image
echo "Pulling the Docker image..."
docker pull $DOCKER_REGISTRY_URL/$DOCKER_REGISTRY_USERNAME/$IMAGE_NAME:latest

# Stop any running container with the same name
echo "Stopping any running container with the name $CONTAINER_NAME..."
docker stop $CONTAINER_NAME || echo "No running container found."

# Remove the stopped container
echo "Removing the stopped container..."
docker rm $CONTAINER_NAME || echo "No container to remove."

# Log in to Docker registry
echo "Logging in to Docker registry..."
echo $DOCKER_REGISTRY_PASSWORD | docker login --username $DOCKER_REGISTRY_USERNAME --password-stdin $DOCKER_REGISTRY_URL

# Start the container
echo "Starting the container..."
docker run -d --name $CONTAINER_NAME $DOCKER_REGISTRY_URL/$DOCKER_REGISTRY_USERNAME/$IMAGE_NAME:latest

echo "Container started successfully!"
