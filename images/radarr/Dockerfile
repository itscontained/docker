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
  && curl -Lso /tmp/radarr.tar.gz \
    "https://radarr.servarr.com/v1/update/nightly/updatefile?version=${VERSION}&os=linux&runtime=netcore&arch=${ARCH}" \
  && mkdir -p /app/radarr/bin \
  && tar ixzf /tmp/radarr.tar.gz -C /app/radarr/bin --strip-components 1 \
  && rm -rf \
       /app/radarr/bin/Radarr.Update \
	     /tmp/radarr.tar.gz \
  && echo "UpdateMethod=docker\nBranch=nightly\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /app/radarr/package_info

EXPOSE 7878

CMD umask ${UMASK} && /app/radarr/bin/Radarr -nobrowser -data=/config
