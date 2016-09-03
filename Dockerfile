FROM centos:latest
MAINTAINER Tiago G. Ribeiro <tiago.sistema@yahoo.com>

ENV TMP_INSTALL_DIR=/tmp/distrib
ENV ISC_PACKAGE_INSTALLDIR="/usr/cachesys"

RUN mkdir ${TMP_INSTALL_DIR}
WORKDIR ${TMP_INSTALL_DIR}

ADD functions /etc/init.d/

ADD cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm .
RUN rpm -iUhv cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm
RUN rm cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm

RUN /etc/init.d/cache start
RUN /etc/init.d/cache stop

WORKDIR /
ADD ccontainermain .
RUN chmod +x ccontainermain

EXPOSE 57772 1972 22

ENTRYPOINT  ["/ccontainermain"]
