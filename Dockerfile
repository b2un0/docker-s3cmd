FROM debian:bookworm-slim

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
