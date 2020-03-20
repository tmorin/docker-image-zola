#!/bin/bash

docker-tags() {
    arr=("$@")
    for item in "${arr[@]}";
    do
        tokenUri="https://auth.docker.io/token"
        data=("service=registry.docker.io" "scope=repository:$item:pull")
        token="$(curl --silent --get --data-urlencode ${data[0]} --data-urlencode ${data[1]} ${tokenUri} | jq --raw-output '.token')"
        listUri="https://registry-1.docker.io/v2/$item/tags/list"
        authz="Authorization: Bearer $token"
        result="$(curl --silent --get -H "Accept: application/json" -H "Authorization: Bearer $token" ${listUri} | jq --raw-output '.')"
        echo ${result}
    done
}

image_versions=$(docker-tags ${tag_image} | jq --raw-output '.["tags"] | to_entries | .[] | .value' | grep "${zola_version}-")
echo "image_versions: $image_versions"

zola_version_major=$(echo ${zola_version} | sed -E "s/([0-9]*)\.[0-9]*\.[0-9]*/\1/")
zola_version_minor=$(echo ${zola_version} | sed -E "s/([0-9]*\.[0-9]*)\.[0-9]*/\1/")

tag_versions="${zola_version} ${zola_version_major} ${zola_version_minor}"
echo "tag_versions: $tag_versions"

if [[ $TRAVIS_BRANCH == "master" ]]; then
    tag_versions="$tag_versions latest"
fi

for tag_version in ${tag_versions} ; do
    manifest_list="$tag_image:$tag_version"
    manifest=""
    for image_version in ${image_versions}; do
        manifest="${manifest} ${tag_image}:${image_version}"
    done
    docker --config .docker manifest create --amend ${manifest_list} ${manifest}
    docker --config .docker manifest push -p ${manifest_list}
done
