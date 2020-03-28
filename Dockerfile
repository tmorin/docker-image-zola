FROM bitnami/minideb AS builder
ARG version=0.10.1
ARG vcs_ref
ARG build_data
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vendor=tmorin \
      org.label-schema.license=MIT \
      org.label-schema.build-date="$build_data" \
      org.label-schema.vcs-ref="$vcs_ref" \
      org.label-schema.vcs-url="https://github.com/tmorin/docker-image-zola"

RUN install_packages python-pip curl tar python-setuptools rsync binutils
RUN pip install dockerize
RUN mkdir -p /workdir
WORKDIR /workdir
RUN curl -L https://github.com/getzola/zola/releases/download/v${version}/zola-v${version}-x86_64-unknown-linux-gnu.tar.gz | tar xz
RUN mv zola /usr/bin
RUN dockerize -n --verbose -o /workdir  /usr/bin/zola

FROM scratch
COPY --from=builder /workdir .
WORKDIR /workdir
ENTRYPOINT [ "/usr/bin/zola" ]
