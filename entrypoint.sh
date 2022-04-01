#!/bin/bash -e

echo "startup $0"

if [ ! -z "${SCHEDULE}" ] &&  [ ! -z "${CRON_CMD}" ]; then
  echo "configure cron: ${SCHEDULE} ${CRON_CMD}"
  echo "${SCHEDULE} ${CRON_CMD}" > /etc/cron.d/s3cmd
fi

echo "run: $@"
exec "$@"
