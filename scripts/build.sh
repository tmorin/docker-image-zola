#!/bin/bash
docker --config .docker build \
    --build-arg vcs_ref="${vcs_ref}" \
    --build-arg build_date="$(date --rfc-3339 ns)" \
    --build-arg version=${zola_version} \
    --tag ${tag} \
    .
docker --config .docker push ${tag}
