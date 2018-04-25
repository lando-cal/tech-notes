Title: Docker Custodian

"Keep docker hosts tidy" - <https://github.com/Yelp/docker-custodian>

# Examples

## Sync script

This script will pull the latest version of some containers and delete old containers and images

```
#!/usr/bin/env bash

containers=(
  debian:latest
  homeassistant/home-assistant:latest
  linuxserver/unifi:latest
  ubuntu:xenial
  yelp/docker-custodian:latest
  )

for c in "${containers[@]}" ; do
  docker pull "$c"
  keepers+=( "--exclude-image" "$c" )
done

docker run -ti -v /var/run/docker.sock:/var/run/docker.sock yelp/docker-custodian \
  dcgc "${keepers[@]}" --dangling-volumes --max-image-age 10w --max-container-age 5w
```
