"An open source project to pack, ship and run any application as a lightweight container."

# Examples
## Show help on the run command

```
docker help run
```

## Run a docker image in an interactive shell

```
docker run -i -t node bash
```

- -i, --interactive
- -t, --tty

[https://docs.docker.com/reference/commandline/cli/#run](https://docs.docker.com/reference/commandline/cli/#run)

## Run a docker image and assign it a hostname, and a docker name

```
docker run --hostname=somehost1 --name="host1" -ti centos:centos6 bash
```

The hostname shows up to the OS.  The docker name can be used to interact with the container:

```
docker ps host1
```

## Run a container with a tcp port map
This maps port 18022 of the host to 22 of the guest.

```
docker run -ti -p 18022:22 centos bash
```

## Run a container with a shared directory
We are specifying :ro to make this a read-only mount

```
docker run -d -v ~/www/:/var/www/html/:ro php:5.4.35-apache
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

[https://docs.docker.com/reference/commandline/cli/#diff](https://docs.docker.com/reference/commandline/cli/#diff)

## View the terminal scrollback of a a container

```
docker logs <container-id>
```

## List all containers, including ones that have been stopped
This allows you to restart previous instances of a container.

```
docker ps -a
```

[https://docs.docker.com/reference/commandline/cli/#ps](https://docs.docker.com/reference/commandline/cli/#ps)

## Start a named container

```
docker start host1
```

## Stop a named container

```
docker stop host1
```

## delete old containers
This is safe to run as long as your valuable containers are running.

```
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
```

[https://docs.docker.com/reference/commandline/cli/#rm](https://docs.docker.com/reference/commandline/cli/#rm)

## delete old images
This is safe to run as long as valuable containers are running, as it won't delete any images that are attached to running containers.

```
docker rmi $(docker images | grep '^<none>' | awk '{print $3}')
```

[https://docs.docker.com/reference/commandline/cli/#rmi](https://docs.docker.com/reference/commandline/cli/#rmi)

## Show processes running inside all docker containers
On hosts without cgroup integration, run:

```
pstree $(pgrep docker)
```

# See Also
- [https://www.docker.io](https://www.docker.io) - Main page
- [http://dockerfile.github.io](http://dockerfile.github.io) - Trusted builds of FOSS software
- [https://registry.hub.docker.com](https://registry.hub.docker.com) - Public docker images
- [https://docs.docker.com/reference/builder/](https://docs.docker.com/reference/builder/) - How to build Dockerfiles
- Shipyard - web based docker container management
