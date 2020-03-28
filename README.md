# docker-image-zola

[![Build Status](https://travis-ci.org/tmorin/docker-image-zola.svg)](https://travis-ci.org/tmorin/docker-image-zola)
[![](https://images.microbadger.com/badges/version/thibaultmorin/zola:latest.svg)](https://microbadger.com/images/thibaultmorin/zola:latest "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/thibaultmorin/zola:latest.svg)](https://microbadger.com/images/thibaultmorin/zola:latest "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/thibaultmorin/zola:latest.svg)](https://microbadger.com/images/thibaultmorin/zola:latest "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/thibaultmorin/zola.svg)](https://microbadger.com/images/thibaultmorin/zola "Get your own license badge on microbadger.com")

Provide a Docker image running [zola](https://getzola.org/).

## Usage

```bash
docker run --rm thibaultmorin/zola --version
```

```bash
docker run -v$(pwd):/workdir --user=$(id --user):$(id --group) --rm thibaultmorin/zola build
```
