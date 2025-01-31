#!/bin/bash

# Variables
CONTAINER_NAME="my-container"  # Replace with your container name

# Stop the container
echo "Stopping the container..."
docker stop $CONTAINER_NAME || echo "No running container found to stop."

# Remove the stopped container
echo "Removing the stopped container..."
docker rm $CONTAINER_NAME || echo "No container to remove."

echo "Container stopped and removed successfully!"