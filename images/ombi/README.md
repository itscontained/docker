# [itscontained/radarr](https://github.com/itscontained/radarr)
[![Github Workflow](https://img.shields.io/github/workflow/status/itscontained/radarr/Check%20and%20Push?labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/itscontained/radarr/actions?query=workflow%3A%22Check+and+Push%22)
[![GitHub Stars](https://img.shields.io/github/stars/itscontained/radarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/itscontained/radarr)
[![Docker Version](https://img.shields.io/docker/v/itscontained/radarr.svg?sort=semver&color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=docker)](https://hub.docker.com/r/itscontained/radarr/tags)
[![Docker Image Size](https://img.shields.io/docker/image-size/itscontained/radarr.svg?sort=semver&color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=docker)](https://hub.docker.com/r/itscontained/radarr/tags)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/itscontained/radarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=docker)](https://microbadger.com/images/itscontained/radarr)
[![Docker Pulls](https://img.shields.io/docker/pulls/itscontained/radarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/itscontained/radarr)
[![Docker Stars](https://img.shields.io/docker/stars/itscontained/radarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/itscontained/radarr)
[![Discord](https://img.shields.io/discord/734273194818535474?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=discord&logo=discord)](https://discord.gg/eT6crpT)

## Supported Architectures
The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | latest |

## Version Tags

This image provides various versions that are available via tags. `latest` tag usually provides the latest available version.

| Tag | Description |
| :----: | --- |
| latest | Newest v3 release from Radarr |
| {semver} | Individual releases as they come |

## Directory Locations
Default Radarr installation locations as defined in their [installation wiki page](https://github.com/Radarr/Radarr/wiki/Installation)

| Folder Type | Location |
| :----: | --- |
| Executable | /opt/Radarr/bin |
| Config | /var/lib/radarr |

## Usage
### Parameters
This is built the way docker initially intended. That means all parameters are things you can set regardless of container.

### Example
```bash
docker run \
    --name radarr \
    --publish 7878:7878 \
    --volume <host config path>:/var/lib/radarr \
    --rm \
    --detach \
    --user 568:568 \
    itscontained/radarr:latest
```