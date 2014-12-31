## Logstash Dockerfile


This repository contains **Dockerfile** of [Logstash](http://logstash.net/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/linman/docker-logstash/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/java](http://dockerfile.github.io/#/java)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/linman/docker-logstash/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull linman/docker-logstash`

   (alternatively, you can build an image from Dockerfile: `docker build -t="linman/docker-logstash" github.com/linman/docker-logstash`)


### Usage

    docker run -d -p 514:514 -p 5043:5043 -p 9292:9292 linman/docker-logstash

#### Attach persistent/shared directories

  1. Create a mountable data directory `<data-dir>` on the host.

  2. Start a container by mounting data directory and specifying the custom configuration file:

    ```sh
    docker run -d -p 514:514 -p 5043:5043 -p 9292:9292 -v <data-dir>:/data linman/docker-logstash
    ```

After few seconds, open `http://<host>:9292/index.html#/dashboard/file/logstash.json` to see the result.
