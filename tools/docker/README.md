# Deployments

This document describes how to deploy the EDA-Controller (AKA eda-server).
Currently there are three supported ways to deploy the EDA-Controller:

* Using docker-compose

## Docker Compose

### Prerequisites

* [Git](https://git-scm.com/)
* [Docker](https://www.docker.com/) or [Podman](https://podman.io/)
* [Docker Compose plugin](https://docs.docker.com/compose/) or `docker-compose` python package.

#### Docker

You'll need to install Docker or Podman.

### Deployment steps

#### Clone the repository

```shell
git clone git@github.com:ansible/eda-server.git
```

```shell
cd tools/docker
```

You may want to pull the latest images from the registry:

```shell
docker-compose -p eda -f docker-compose-stage.yaml pull
```

You can start all services with:

```shell
docker-compose -p eda -f docker-compose-stage.yaml up
```

You can now inspect the API documentation at <https://localhost:8443/api/eda/v1/docs>
or navigate through the resources with the DRF browsable API at <https://localhost:8443/api/eda/v1/>

You can also access the standalone UI at <http://localhost:8443/> with the default credentials `admin`/`testpass`.
