FROM ubuntu:14.04
MAINTAINER jsheradin <jsheradin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Build tools
RUN apt-get update && apt-get -y --no-install-recommends install \
    openjdk-7-jdk \
    python \
    bc \
    yasm \
    rsync \
    schedtool \
    imagemagick \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    lzop \
    unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

# Add tools
ADD https://commondatastorage.googleapis.com/git-repo-downloads/repo /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

# Add user
RUN useradd --system --create-home --home-dir /opt/lineage --shell /bin/bash --gid root --uid 1000 --groups sudo lineage
USER lineage
WORKDIR /opt/lineage

#Add /lineage and /ccache volumes
VOLUME /lineage/
VOLUME /ccache/

COPY /root /

ENTRYPOINT ["bash", "/run.sh"]
