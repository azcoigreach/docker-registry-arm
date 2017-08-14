# Build a minimal distribution container

FROM arm32v7/debian:latest

RUN apt-get update && \
    apt-get install -y ca-certificates apache2-utils && \
    rm -rf /var/lib/apt/lists/*

COPY ./registry/registry /bin/registry
COPY ./registry/config-example.yml /etc/docker/registry/config.yml

VOLUME ["/var/lib/registry"]
EXPOSE 5000
ENTRYPOINT ["/bin/registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]
