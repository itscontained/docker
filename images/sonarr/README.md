# [itscontained/sonarr](https://github.com/itscontained/sonarr)	# This repository is deprecated and as part of the itscontained/docker repo [here](https://github.com/itscontained/docker/tree/master)
[![Github Workflow](https://img.shields.io/github/workflow/status/itscontained/sonarr/Check%20and%20Push?labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/itscontained/sonarr/actions?query=workflow%3A%22Check+and+Push%22)	
[![GitHub Stars](https://img.shields.io/github/stars/itscontained/sonarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/itscontained/sonarr)	
[![Docker Version](https://img.shields.io/docker/v/itscontained/sonarr.svg?sort=semver&color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=docker)](https://hub.docker.com/r/itscontained/sonarr/tags)	
[![Docker Image Size](https://img.shields.io/docker/image-size/itscontained/sonarr.svg?sort=semver&color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=docker)](https://hub.docker.com/r/itscontained/sonarr/tags)	
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/itscontained/sonarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=docker)](https://microbadger.com/images/itscontained/sonarr)	
[![Docker Pulls](https://img.shields.io/docker/pulls/itscontained/sonarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/itscontained/sonarr)	
[![Docker Stars](https://img.shields.io/docker/stars/itscontained/sonarr.svg?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/itscontained/sonarr)	
[![Discord](https://img.shields.io/discord/734273194818535474?color=00E5D2&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=discord&logo=discord)](https://discord.gg/eT6crpT)	

## Supported Architectures	
The architectures supported by this image are:	

| Architecture | Tag |	
| :----: | --- |	
| x86-64 | latest |	

## Version Tags	

This image provides various versions that are available via tags.	
`latest` tag usually provides the latest available version.	

| Tag | Description |	
| :----: | --- |	
| latest | Newest v3 release from Sonarr |	
| {semver} | Individual releases as they come |	

## Directory Locations	
Default Sonarr installation locations as defined in their 	
[v3 downloads instructions for ubuntu](https://sonarr.tv/#downloads-v3-linux-ubuntu)	

| Folder Type | Location |	
| :----: | --- |	
| Executable | /usr/lib/sonarr/bin |	
| Config | /var/lib/sonarr |	

## Usage	
### Parameters	
This is built the way docker initially intended. That means all parameters are things you can set regardless of container.	

### Example	
```bash	
docker run \	
    --name sonarr \	
    --publish 8989:8989 \	
    --volume <host config path>:/var/lib/sonarr \	
    --rm \	
    --detach \	
    --user 568:568 \	
    itscontained/sonarr:latest	
```