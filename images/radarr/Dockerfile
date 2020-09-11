FROM itscontained/ubuntu:focal-20200729

ARG VERSION=3.0.0.3695

ENV DEBIAN_FRONTEND=noninteractive \
    UMASK=0002

USER root
RUN \
 # Install prereqs
 apt update && \
 apt install libicu66 mediainfo -y --no-install-recommends && \
 apt-get clean && \
  rm -rf \
 	   /tmp/* \
 	   /var/lib/apt/lists/* \
 	   /var/tmp/

USER itscontained:itscontained
 # install app
 curl -Lso /tmp/radarr.tar.gz \
    "https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${VERSION}&os=linux&runtime=netcore&arch=x64" && \
 mkdir -p /app/Radarr/bin && \
 tar ixzf /tmp/radarr.tar.gz -C /app/Radarr/bin --strip-components 1 && \
 # cleanup
 rm -rf \
    /app/radarr/bin/Radarr.Update \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* && \
 # make package info
 echo "UpdateMethod=docker\nBranch=aphrodite\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /app/Radarr/package_info && \
 # set umask for exec login
 echo umask ${UMASK} >> /etc/bash.bashrc

# ports
EXPOSE 7878

# Convenience dir
WORKDIR /config

CMD umask ${UMASK} && /app/Radarr/bin/Radarr -nobrowser -data=/config