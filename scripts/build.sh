#!/bin/bash
docker --config .docker build \
    --build-arg vcf_ref="${vcf_ref}" \
    --build-arg build_date="$(date --rfc-3339 ns)" \
    --build-arg version=${zola_version} \
    --tag ${tag} \
    .
docker --config .docker push ${tag}
