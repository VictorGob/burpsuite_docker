#!/bin/bash

DOCKER_BUILDKIT=1 docker build --no-cache --rm=true -t burpsuite:latest \
    --build-arg user=$USER --build-arg uid="$(id -u)" --build-arg gid="$(id -g)" .