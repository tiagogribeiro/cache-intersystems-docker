FROM centos:latest
MAINTAINER Tiago G. Ribeiro <tiago.sistema@yahoo.com>

RUN yum -y update && yum -y install which tar hostname net-tools wget && yum -y clean all

ENV TMP_INSTALL_DIR=/tmp/distrib

ENV ISC_PACKAGE_INSTANCENAME="CACHE" \
    ISC_PACKAGE_INSTALLDIR="/usr/cachesys" \
    ISC_PACKAGE_UNICODE="Y" \
    ISC_PACKAGE_CSP_GATEWAY_DIR="/opt/cspgateway/"

RUN mkdir ${TMP_INSTALL_DIR}
WORKDIR ${TMP_INSTALL_DIR}

#ADD cache-2016.2.0.736.0su-lnxrhx64.tar.gz .
RUN wget http://download2.intersystems.com/webcinst/201621/7AF8/LINUX/cache-2016.2.1.803.0su-lnxrhx64.tar.gz
RUN tar -xzf cache-2016.2.1.803.0su-lnxrhx64.tar.gz

RUN ./cache-2016.2.0.736.0su-lnxrhx64/cinstall_silent && \
    rm -rf ${TMP_INSTALL_DIR}

RUN ccontrol stop $ISC_PACKAGE_INSTANCENAME quietly

EXPOSE 80 57772 1972 22

WORKDIR /
ADD ccontainermain .
RUN chmod +x ccontainermain

ENTRYPOINT ["/ccontainermain"]
