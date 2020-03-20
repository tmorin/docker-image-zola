[![Build Status](https://travis-ci.org/tmorin/docker-image-zola.svg)](https://travis-ci.org/tmorin/docker-image-zola)

# docker-image-zola

Provide a Docker image running [zola](https://getzola.org/).

## Usage

```bash
docker run --rm thibaultmorin/zola --version
```

```bash
docker run -v$(pwd):/workdir --user=$(id --user):$(id --group) --rm thibaultmorin/zola build
```
