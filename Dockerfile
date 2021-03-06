# Build a minimal distribution container

FROM arm32v7/debian:jessie

RUN apt-get update && \
    apt-get install -y ca-certificates apache2-utils && \
    rm -rf /var/lib/apt/lists/*

COPY ./registry/registry /bin/registry

RUN mkdir -p /etc/docker/registry && \
    mkdir -p /var/lib/registry

COPY ./registry/config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]
VOLUME ["/etc/docker/registry"]
EXPOSE 5000
ENTRYPOINT ["/bin/registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]
