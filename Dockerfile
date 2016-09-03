FROM centos:latest
MAINTAINER Tiago G. Ribeiro <tiago.sistema@yahoo.com>

ENV TMP_INSTALL_DIR=/tmp/distrib
ENV ISC_PACKAGE_INSTANCENAME="cache"
ENV ISC_PACKAGE_INSTALLDIR="/usr/cachesys"

RUN mkdir ${TMP_INSTALL_DIR}
WORKDIR ${TMP_INSTALL_DIR}

ADD cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm .
RUN rpm -iUhv cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm
RUN mv ${ISC_PACKAGE_INSTALLDIR}/install.cpf ${ISC_PACKAGE_INSTALLDIR}/cache.cpf
RUN cp cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm

WORKDIR /
ADD ccontainermain .
RUN chmod +x ccontainermain

EXPOSE 57772 1972 22

ENTRYPOINT  ["/ccontainermain"]
