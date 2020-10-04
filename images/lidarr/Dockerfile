FROM itscontained/ubuntu:focal-20200925

ARG TARGETPLATFORM
ARG VERSION

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
  	   libicu66 \
	     mediainfo \
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
  && curl -Lso /tmp/lidarr.tar.gz \
    "https://lidarr.servarr.com/v1/update/nightly/updatefile?version=${VERSION}&os=linux&runtime=netcore&arch=${ARCH}" \
  && mkdir -p /app/lidarr/bin \
  && tar ixzf /tmp/lidarr.tar.gz -C /app/lidarr/bin --strip-components 1 \
  && rm -rf \
       /app/lidarr/bin/lidarr.Update \
	     /tmp/lidarr.tar.gz \
  && echo "UpdateMethod=docker\nBranch=develop\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /app/lidarr/package_info

EXPOSE 7878

CMD umask ${UMASK} && /app/lidarr/bin/lidarr -nobrowser -data=/config
