FROM registry.access.redhat.com/ubi9

ARG BUILD_DATE

LABEL summary="Red Hat Universal Base Image 9 with git."
LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build-date=${BUILD_DATE}

RUN curl -Lo git-lfs.rpm https://packagecloud.io/github/git-lfs/packages/el/7/git-lfs-2.12.0-1.el7.x86_64.rpm/download \
    && dnf install -y git-lfs.rpm \
    && rm git-lfs.rpm

RUN dnf -y update && dnf -y install \
    git \
    && dnf clean all
