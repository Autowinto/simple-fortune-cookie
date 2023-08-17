#!/bin/bash
echo "$docker_password" | docker login ghcr.io --username "${docker_username,,}" --password-stdin
docker pull "ghcr.io/${docker_username,,}/fortune-cookie:latest" &

