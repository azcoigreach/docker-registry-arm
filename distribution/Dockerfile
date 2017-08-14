FROM arm32v7/golang:latest

ENV DISTRIBUTION_DIR /go/src/github.com/docker/distribution
ENV DOCKER_BUILDTAGS include_oss include_gcs

ARG GOOS=linux
ARG GOARCH=arm

RUN apt-get update && \
    apt-get install make git -y

WORKDIR $DISTRIBUTION_DIR
COPY . $DISTRIBUTION_DIR

RUN mkdir /etc/docker/registry
COPY cmd/registry/config-dev.yml /etc/docker/registry/config.yml

RUN make PREFIX=/go clean binaries

VOLUME ["/var/lib/registry"]
EXPOSE 5000
ENTRYPOINT ["registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]
