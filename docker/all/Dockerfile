# -*- shell-script -*-
# run with
#
# docker -v ../..:/home/builduser/swarco-linux-v3 build


FROM debian:jessie
MAINTAINER Guido Classen <clagix@gmail.com>

LABEL description="Automated Build for SWARCO Embedded Linux V3 operating system"

# older Docker version don't understand "ARG"
ENV DEBIAN_FRONTEND noninteractive

# 2022-11-21 gc: globally set apt options
#                `Acquire::Check-Valid-Until` and `APT::Get::force-yes`
#                because GPG-keys for APT-packages from Debian Jessie have been
#                expired. It seams that this keys will not be updated again.
#                So we must install packages without checking for expired keys!
#                THIS MY BE DANGEROUS!
#
RUN useradd -ms /bin/bash builduser &&                  \
    echo Acquire::Check-Valid-Until false\; >/etc/apt/apt.conf.d/allow-insecure-repositories && \
    echo APT::Get::force-yes true\; >>/etc/apt/apt.conf.d/allow-insecure-repositories && \
    echo out: &&\
    cat /etc/apt/apt.conf.d/allow-insecure-repositories &&\
    apt-get --yes --force-yes update &&                             \
    apt-get --yes --force-yes --no-install-recommends install       \
            autoconf                                    \
            automake                                    \
            bison                                       \
            bzip2                                       \
            ca-certificates                             \
            cpp                                         \
            curl                                        \
            cvs                                         \
            flex                                        \
            g++                                         \
            gcc                                         \
            gettext                                     \
            git                                         \
            groff-base                                  \
            libc6-dev                                   \
            liblzo2-2                                   \
            liblzo2-dev                                 \
            libncurses5-dev                             \
            libz-dev                                    \
            make                                        \
            net-tools                                   \
            patch                                       \
            perl                                        \
            perl-modules                                \
            texinfo                                     \
            xz-utils                                    \
            cmake                                       \
            wget                                        \
            cpio                                        \
            python                                      \
            unzip                                       \
            rsync                                       \
            bc                                          \
            locales                                     \
            file                                        \
            uuid-dev                                    \
            &&                                          \
    apt-get clean &&                                    \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN ls -l /home
# RUN ls -l /home/builduser
# RUN cat /etc/passwd

#    locale-gen en_US.utf8 &&                           \
#    /usr/sbin/update-locale LANG=en_US.utf8 &&         \

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8


#COPY docker_build.sh /home/builduser/
#USER builduser

#RUN ls -l /home/builduser
ADD . /home/builduser/swarco-linux-v3
WORKDIR /home/builduser/swarco-linux-v3
ARG BUILDROOT_CONFIG
RUN docker/all/docker_build.sh ${BUILDROOT_CONFIG}

#reset DEBIAN_FRONTEND to default value
ENV DEBIAN_FRONTEND newt

#USER root
