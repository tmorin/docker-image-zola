#!/bin/bash
docker --config .docker build --build-arg version=${zola_version} --tag ${tag} .
docker --config .docker push ${tag}
