# docker-image-zola

![Build Images](https://github.com/tmorin/docker-image-zola/workflows/Build%20Images/badge.svg)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/thibaultmorin/zola?label=thibaultmorin%2Fzola)](https://hub.docker.com/r/thibaultmorin/zola)

Provide a Docker image running [zola](https://getzola.org/).

## Usage

```bash
docker run --rm thibaultmorin/zola --version
```

```bash
docker run -v$(pwd):/workdir --user=$(id --user):$(id --group) --rm thibaultmorin/zola build
```
