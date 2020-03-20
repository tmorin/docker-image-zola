#!/bin/bash
mkdir -p .docker
echo '{"experimental": "enabled"}' > .docker/config.json
echo "$DOCKER_PASSWORD" | docker --config .docker login -u "$DOCKER_USERNAME" --password-stdin
