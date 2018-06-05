Title: docker

"An open source project to pack, ship and run any application as a lightweight container." - <https://www.docker.com/>

# Examples

## Show help on the run command

```
docker help run
```

## Show the history of an image, and count its layers

```
docker history ubuntu:bionic | nl -ba -v0
```

## Run a docker image in an interactive shell

```
docker run -i -t node bash
```

- -i, --interactive
- -t, --tty

<https://docs.docker.com/reference/commandline/cli/#run>

## Get a bash terminal on a running docker container

```
docker exec -i -t container_name bash
```

## Run a docker image and assign it a hostname, and a docker name

```
docker run --hostname=somehost1 --name="host1" -ti centos:centos6 bash
```

The hostname shows up to the OS. The docker name can be used to interact with the container:

```
docker ps host1
```

## Show a complete vertically oriented list of docker processes

`docker ps` has no `--json` flag, but you can work around that with golang style formatting.

```
docker ps --no-trunc --format='{{ . | json }}' | jq -S .
```

This trick also works with `docker images`, which also lacks a `--json` arg.

## Run a container with a tcp port map

This maps port 18022 of the host to 22 of the guest.

```
docker run -ti -p 18022:22 centos bash
```

## Run a container with a shared directory

We are specifying :ro to make this a read-only mount. Default is rw.

```
docker run -d -v "$HOME/www/:/var/www/html/:ro" php:5.4.35-apache
```

## Show configuration parameters for a container

This shows more things that you can configure, like DNS, DNS search, etc..

```
docker inspect host1
```

## Show what has changed since a container was started

```
docker diff <container-id>
```

<https://docs.docker.com/reference/commandline/cli/#diff>

## View the terminal scrollback of a a container

```
docker logs <container-id>
```

## List all containers, including ones that have been stopped

This allows you to restart previous instances of a container.

```
docker ps -a
```

<https://docs.docker.com/reference/commandline/cli/#ps>

## Start a named container

By default containers don't restart when your system restarts, so you have to start them manually.

```
docker start ttrss
```

## Stop a named container

```
docker stop ttrss
```

## Update the restart policy on a running container

```
docker update --restart=unless-stopped 3a898cb672ad
```

## Get a shell on a running container

```
docker exec -ti ttrss bash
```

## Delete old containers

<https://docs.docker.com/reference/commandline/cli/#rm>

Remove `-r` from `xargs` on non-GNU systems.

```
docker ps -a --format="{{.ID}} {{.Status}}" | awk '$2 == "Exited" && $5 ~ /(days|weeks|months)/ {print $1}' | xargs -r docker rm
```

A more systematic approach is to use [Docker Custodian](https://github.com/Yelp/docker-custodian).

## Delete old images

This is safe to run as long as valuable containers are running, as it won't delete any images that are attached to running containers.

```
docker rmi $(docker images | grep '^<none>' | awk '{print $3}')
```

<https://docs.docker.com/reference/commandline/cli/#rmi>

A more systematic approach is to use [Docker Custodian](https://github.com/Yelp/docker-custodian).

## Show processes running inside all docker containers

On hosts without cgroup integration, run:

```
pgrep docker | xargs -n1 pstree
```

# See Also

- <https://www.docker.io> - Main page
- <http://dockerfile.github.io> - Trusted builds of FOSS software
- <https://registry.hub.docker.com> - Public docker images
- <https://docs.docker.com/reference/builder/> - How to build Dockerfiles
