#!/bin/bash
IMAGE=9lan/karsajobs-ui:latest

echo "======================================"
echo "| Build and push docker image script |"
echo "======================================\n"

# Build docker image
echo "Build image"
echo "--------------------------"
docker build -t $IMAGE .
echo "\n"

# Login to Github
echo "Login to Github"
echo "--------------------------"
echo $GITHUB_TOKEN | docker login ghcr.io -u 9lan --password-stdin
echo "\n"

# Push image to Github Package
echo "Push image to Github Package"
echo "--------------------------"
docker push ghcr.io/$IMAGE
echo "\n"

# Logout dari ghcr.io
echo "Logout"
echo "--------------------------"
docker logout ghcr.io
