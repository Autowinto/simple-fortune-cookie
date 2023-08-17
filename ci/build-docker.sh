#!/bin/bash
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
[[ -z "${docker_username,,}" ]] && DockerRepo='' || DockerRepo="ghcr.io/${docker_username,,}/"
# Debugging: Print current working directory and ls output
pwd
ls -la

# Debugging: Print the context path being used
echo "Building Docker image with context: $(pwd)/frontend/"
docker build -t "${DockerRepo}fortune-cookie-frontend:latest" -t "${DockerRepo}fortune-cookie-frontend:1.0-$Tag" frontend/
docker build -t "${DockerRepo}fortune-cookie-backend:latest" -t "${DockerRepo}fortune-cookie-backend:1.0-$Tag" backend/
