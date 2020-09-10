FROM ubuntu:focal
MAINTAINER dirtycajunrice

ARG VERSION=3.0.0.3695

ENV DEBIAN_FRONTEND=noninteractive \
    UMASK=0002

RUN \
 # Install prereqs
 apt update && \
 apt install libicu66 curl ca-certificates  mediainfo -y --no-install-recommends && \
 # create user/group
 adduser radarr \
   --uid 568 \
   --group \
   --system \
   --disabled-password \
   --no-create-home && \
 # install app
 curl -Lso /tmp/radarr.tar.gz \
    "https://radarr.lidarr.audio/v1/update/aphrodite/updatefile?version=${VERSION}&os=linux&runtime=netcore&arch=x64" && \
 mkdir -p /opt/Radarr/bin && \
 tar ixzf /tmp/radarr.tar.gz -C /opt/Radarr/bin --strip-components 1 && \
 # cleanup
 apt-get clean && \
 rm -rf \
    /app/radarr/bin/Radarr.Update \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* && \
 # make package info
 echo "UpdateMethod=docker\nBranch=aphrodite\nPackageVersion=${VERSION}\nPackageAuthor=[Team itscontained](https://github.com/itscontained)" > /opt/Radarr/package_info && \
 # set umask for exec login
 echo umask ${UMASK} >> /etc/bash.bashrc

# ports
EXPOSE 7878

# set default user
USER radarr:radarr

# Convenience dir
WORKDIR /var/lib/radarr

CMD umask ${UMASK} && /opt/Radarr/bin/Radarr -nobrowser -data=/var/lib/radarr