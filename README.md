# docker-nginx-consul

| [![Build Status](https://travis-ci.org/activatedgeek/docker-nginx-consul.svg?branch=master)](https://travis-ci.org/activatedgeek/docker-nginx-consul) | [![](https://badge.imagelayers.io/activatedgeek/nginx-consul.svg)](https://hub.docker.com/r/activatedgeek/nginx-consul) |
|:-:|:-:|

The front-end proxy for all the services, backed by Consul for
service registry.

**NOTE**: Consul service needs to be separately started

The container contains the following packages:
* `Nginx` (1.9)
* `Consul-Template` (0.14.0)

## Images

* `latest`, `0.2`, `0.2.0` ([Dockerfile](./Dockerfile))
* `0.1`, `0.1.4` (based on `Consul Template 0.13.0`)

## Usage
Pull the docker image from Docker hub as:
```
> docker pull activatedgeek/nginx-consul
```

The following environment variables are configurable:
* `CONSUL_HOST`: complete URL to Consul Agent/Server including
port (default = `127.0.0.1:8500`), passed to the `-consul` CLI
argument
* `CONSUL_LOG_LEVEL`: logging level for Consul (default = `info`)
, passed to the `-log-level` CLI argument
* `CONSUL_TEMPLATE_CONFIG`: path to the Hashicorp Configuration
which contains list of all templates to be rendered (default =
  `/templates/config.hcl`)

The image provides a `/templates` mount point for starters.

As an example, the `./consul-template` folder has been provided,
which can be mounted as:
```
> docker run -d -p 8080:80 \
    -v "/path/to/consul-template:/templates" \
    --name test-nginx-consul \
    --dns=8.8.8.8 \
    activatedgeek/nginx-consul:latest
```

Now point your browser to,
```
http://service_name:8080
```
to see the output, where `service_name` points to the IP address
of the host running this docker container.

**NOTE**: `docker-machine` users will need to point to
the correct docker host instead of `localhost`.

## Build
To build the latest image from source, run
```
> make latest
```
