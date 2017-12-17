# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

# docker build --rm --no-cache -t linux.feature/lamp .
# docker run --privileged -d -p 2222:22 -p 8080:80 linux.feature/lamp
# docker update --restart=unless-stopped <container>

# login via ssh, change root password
# sh /root/linux.feature/script/centos7/08.2-set-pass-mysql.sh `pwgen -y 12 1`

FROM centos/systemd

MAINTAINER "linux.feature"

RUN yum -y update; yum -y install mc git rsyslog postfix;
RUN cd /root; git clone https://github.com/faew/linux.feature.git
RUN cd /root/linux.feature/script/centos7/; sh 01-install-utils.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 05-install-apache.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 06-install-devel.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 08-install-mysql.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 09-install-sphinx.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 10-install-redis.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 30-compile-icu.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 30-compile-php-7.1.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 35-install-crond.sh; exit 0
RUN cd /root/linux.feature/script/centos7/; sh 36-install-sshd.sh; exit 0
RUN yum clean all;rm -f /run/nologin

ARG root_pass=zx234HgF77Kpsj
RUN echo $root_pass | passwd root --stdin

VOLUME /etc
VOLUME /var/log
VOLUME /var/lib/sphinx
VOLUME /var/lib/mysql
VOLUME /var/www

CMD ["/usr/sbin/init"]
