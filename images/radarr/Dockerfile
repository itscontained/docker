FROM itscontained/ubuntu:focal-20200729

ARG TARGETPLATFORM=linux/amd64
ARG VERSION=3.0.0.3695

USER root

RUN \
  apt-get update \
  && apt-get install libicu66 mediainfo -y --no-install-recommends \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER itscontained

RUN \
  case "${TARGETPLATFORM}" in \
    'linux/amd64') export ARCH='x64' ;; \
    'linux/arm64') export ARCH='arm64' ;; \
    'linux/arm/v7') export ARCH='arm' ;; \
  esac \
  && curl -Lso /tmp/radarr.tar.gz \
    "https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${VERSION}&os=linux&runtime=netcore&arch=${ARCH}" \
  && mkdir -p /app/Radarr/bin \
  && tar ixzf /tmp/radarr.tar.gz -C /app/Radarr/bin --strip-components 1 \
  && rm -rf \
    /app/radarr/bin/Radarr.Update \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* \
  && echo "UpdateMethod=docker\nBranch=aphrodite\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /app/Radarr/package_info

EXPOSE 7878

CMD umask ${UMASK} && /app/Radarr/bin/Radarr -nobrowser -data=/config