FROM debian:bullseye-slim

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV SCHEDULE="" \
    CRON_CMD=""

RUN apt update && \
    apt install -y s3cmd cron ca-certificates && \
    apt clean && \
    mkdir /sync

WORKDIR /sync

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/cron", "-f"]

SHELL ["/bin/bash"]

LABEL org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.version=${VERSION} \
      org.opencontainers.image.source="https://github.com/b2un0/docker-s3cmd"
