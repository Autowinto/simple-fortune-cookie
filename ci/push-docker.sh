#!/bin/bash
echo "$docker_password" | docker login ghcr.io --username "${docker_username,,}" --password-stdin
docker push "ghcr.io/${docker_username,,}/fortune-cookie:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/${docker_username,,}/fortune-cookie:latest" &
