# docker s3cmd wrapper

![](https://img.shields.io/github/license/b2un0/docker-s3cmd.svg)
![](https://img.shields.io/docker/pulls/b2un0/s3cmd.svg)
![](https://img.shields.io/docker/stars/b2un0/s3cmd.svg)
![](https://img.shields.io/docker/image-size/b2un0/s3cmd.svg)
![](https://github.com/b2un0/docker-s3cmd/workflows/container/badge.svg)

simple docker container to run (scheduled) s3cmd

**Note**: you must create your [.s3cfg](https://s3tools.org/kb/item14.htm) first!

## one shot example

```bash
docker run -it --rm -v ${PWD}/.s3cfg:/root/.s3cfg ghcr.io/b2un0/docker-s3cmd s3cmd ls
```

## scheduled example

`docker-compose.yaml`

```yaml
services:
  something:
    image: ghcr.io/b2un0/docker-s3cmd:latest
    restart: unless-stopped
    network_mode: bridge
    # command: "s3cmd ls" # for one shot
    volumes:
      - ./root/.s3cfg:/root/.s3cfg:ro
    environment:
      SCHEDULE: "15 3 * * *" # https://crontab.guru/
      CRON_CMD: "s3cmd sync --dry-run /sync s3://some-bucket"
```
