FROM itscontained/ubuntu:focal-20200729

ARG VERSION=3.0.3.924

USER root

RUN \
  apt-get -qq update \
  && apt-get -qq install -y --no-install-recommends gnupg \
	&& apt-key adv \
        --keyserver hkp://keyserver.ubuntu.com \
        --recv-keys \
          3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
          C5CDF62C7AE05CC847657390C10E11090EC0E438 \
  && echo "deb http://download.mono-project.com/repo/ubuntu stable-focal main" \
          > /etc/apt/sources.list.d/mono-official-stable.list \
  && echo "deb https://mediaarea.net/repo/deb/ubuntu focal main" \
          > /etc/apt/sources.list.d/mediaarea.list \
  && apt-get -qq install -y --no-install-recommends \
       libicu66 \
       mediainfo \
       mono-devel \
       ca-certificates-mono \
  && gpgconf --kill all \
  && apt remove -y gnupg2 \
  && apt purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf \
       /tmp/* \
       /var/lib/apt/lists/* \
       /var/cache/apt/* \
       /var/tmp/ \
  && echo umask ${UMASK} >> /etc/bash.bashrc

USER itscontained

RUN \
  curl -Lso /tmp/sonarr.tar.gz \
    "https://download.sonarr.tv/v3/phantom-develop/${VERSION}/Sonarr.phantom-develop.${VERSION}.linux.tar.gz" \
  && mkdir -p /app/sonarr/bin \
  && tar ixzf /tmp/sonarr.tar.gz -C /app/sonarr/bin --strip-components 1 \
  && rm -rf \
      /app/sonarr/bin/Sonarr.Update \
	    /tmp/sonarr.tar.gz \
  && echo "UpdateMethod=docker\nBranch=phantom-develop\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /app/sonarr/package_info

EXPOSE 8989

CMD umask ${UMASK} && /usr/bin/mono --debug /app/sonarr/bin/Sonarr.exe -nobrowser -data=/config