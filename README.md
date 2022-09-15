<h3 align="center">gandyn (Dockerized)</h3>
<p align="center">
    A simple Dockerfile/docker-compose to run <a href="https://github.com/Danamir/dyn-gandi">gandyn</a>.
    <br>
    <a href="https://github.com/baptistecdr/docker-gandyn/issues/new">Report bug</a>
    ·
    <a href="https://github.com/baptistecdr/docker-gandyn/issues/new">Request feature</a>
</p>

<div align="center">

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/baptistecdr/docker-gandyn/ci)
![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/baptistecdr/gandyn)
![Docker Pulls](https://img.shields.io/docker/pulls/baptistecdr/gandyn)
![GitHub](https://img.shields.io/github/license/baptistecdr/docker-gandyn)

</div>

## Quick start

* Copy [config.ini-dist](https://github.com/Danamir/dyn-gandi/blob/master/config.ini-dist) to `config.ini`
* Modify `config.ini` depending on your configuration.
* `gandyn` is executed every minute

### Docker

```shell
docker run --rm --privileged \
--mount type=bind,source=./config.ini,target=/config/config.ini \
-e TZ="Europe/Paris" \
baptistecdr/gandyn
```

### Docker Compose

* Download docker-compose file
```shell
wget https://raw.githubusercontent.com/baptistecdr/docker-gandyn/main/docker-compose.yml
```

* Run `docker-compose up -d`

## Bugs and feature requests

Have a bug or a feature request? Please first search for existing and closed issues. If your problem or idea is not
addressed yet, [please open a new issue](https://github.com/baptistecdr/docker-gandyn/issues).

## Contributing

Contributions are welcome!
