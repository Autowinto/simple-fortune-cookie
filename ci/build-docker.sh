#!/bin/bash
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
[[ -z "${docker_username,,}" ]] && DockerRepo='' || DockerRepo="ghcr.io/${docker_username,,}/"
docker build -t "${DockerRepo}fortune-cookie:latest" -t "${DockerRepo}fortune-cookie:1.0-$Tag" app/
