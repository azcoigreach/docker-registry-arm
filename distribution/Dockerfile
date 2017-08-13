FROM arm32v6/golang:1.7.6-alpine3.5

ENV DISTRIBUTION_DIR /go/src/github.com/docker/distribution
ENV DOCKER_BUILDTAGS include_oss include_gcs

RUN apk update && apk add make git

WORKDIR $DISTRIBUTION_DIR
COPY . $DISTRIBUTION_DIR
COPY cmd/registry/config-dev.yml /etc/docker/registry/config.yml

RUN make PREFIX=/go clean binaries

VOLUME ["/var/lib/registry"]
EXPOSE 5000
ENTRYPOINT ["registry"]
CMD ["serve", "/etc/docker/registry/config.yml"]