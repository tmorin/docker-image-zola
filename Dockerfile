FROM rust AS builder
ARG version="0.14.1"
RUN apt-get update
RUN apt-get install -y python-pip curl tar python-setuptools rsync binutils
RUN pip install dockerize
RUN mkdir -p /workdir
WORKDIR /workdir
RUN curl -L https://github.com/getzola/zola/archive/refs/tags/v${version}.tar.gz | tar xz
WORKDIR /workdir/zola-${version}
RUN cargo build --release
RUN cp target/release/zola /usr/bin
WORKDIR /workdir/output
RUN dockerize -n --verbose -o /workdir/output  /usr/bin/zola

FROM scratch
ARG git_sha=""
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="tmorin" \
      org.label-schema.license="MIT" \
      org.label-schema.vcs-ref="$git_sha" \
      org.label-schema.vcs-url="https://github.com/tmorin/docker-image-zola"
COPY --from=builder /workdir/output .
WORKDIR /workdir
ENTRYPOINT [ "/usr/bin/zola" ]
