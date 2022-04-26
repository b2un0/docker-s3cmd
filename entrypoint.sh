#!/bin/bash -e

echo "startup $0"

USER="${USER:-root}"

if [ ! -z "${SCHEDULE}" ] &&  [ ! -z "${CRON_CMD}" ]; then
  echo "configure cron: ${SCHEDULE} ${USER} ${CRON_CMD}"
  echo "${SCHEDULE} ${USER} ${CRON_CMD} > /proc/1/fd/1 2>&1" > /etc/crontab
fi

echo "run: $@"
exec "$@"
