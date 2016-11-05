FROM centos:latest
MAINTAINER Tiago G. Ribeiro <tiago.sistema@yahoo.com>

RUN yum -y update && yum -y install which tar hostname net-tools wget && yum -y clean all

ENV TMP_INSTALL_DIR=/tmp/distrib
ENV TMP_FILE_INSTALL="cache-2016.2.1.803.0su-lnxrhx64.tar.gz"
ENV TMP_DIRECTORY="cache-2016.2.1.803.0su-lnxrhx64"

ENV ISC_PACKAGE_INSTANCENAME="CACHE" \
    ISC_PACKAGE_INSTALLDIR="/usr/cachesys" \
    ISC_PACKAGE_UNICODE="Y"

RUN mkdir ${TMP_INSTALL_DIR} 
WORKDIR ${TMP_INSTALL_DIR}

RUN wget -c --progress=bar http://download2.intersystems.com/webcinst/201621/7AF8/LINUX/${TMP_FILE_INSTALL} 
RUN tar -xzf ${TMP_FILE_INSTALL}

RUN ./${TMP_DIRECTORY}/cinstall_silent && rm -rf ${TMP_INSTALL_DIR}
    
RUN ccontrol stop $ISC_PACKAGE_INSTANCENAME quietly

EXPOSE 57772 1972 22

WORKDIR /
ADD ccontainermain .
RUN chmod +x ccontainermain

ENTRYPOINT ["/ccontainermain"]
