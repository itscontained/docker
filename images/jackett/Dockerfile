FROM itscontained/ubuntu:focal-20200925

ARG TARGETPLATFORM
ARG VERSION

ENV XDG_CONFIG_HOME=/config

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends \
  	   libicu66 \
	     libssl1.1 \
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
    'linux/amd64') export ARCH='AMDx64' ;; \
    'linux/arm64') export ARCH='ARM64' ;; \
    'linux/arm/v7') export ARCH='ARM32' ;; \
  esac \
  && curl -Lso /tmp/jackett.tar.gz \
    "https://github.com/Jackett/Jackett/releases/download/${VERSION}/Jackett.Binaries.Linux${ARCH}.tar.gz" \
  && mkdir -p /app/jackett/bin \
  && tar ixzf /tmp/jackett.tar.gz -C /app/jackett/bin --strip-components 1 \
  && rm -rf \
    /app/jackett/bin/JackettUpdater \
    /app/jackett/bin/JackettUpdater.deps.json \
    /app/jackett/bin/JackettUpdater.dll \
    /app/jackett/bin/JackettUpdater.pdb \
    /app/jackett/bin/JackettUpdater.runtimeconfig.json \
    /tmp/jackett.tar.gz \
  && echo "UpdateMethod=docker\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /app/jackett/package_info

EXPOSE 7878

CMD umask ${UMASK} && /app/jackett/bin/jackett --NoUpdates
