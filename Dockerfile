FROM centos:latest
MAINTAINER TiagoRibeiro <tiago.sistema@yahoo.com>

ENV TMP_INSTALL_DIR=/tmp/distrib

RUN mkdir ${TMP_INSTALL_DIR}
WORKDIR ${TMP_INSTALL_DIR}

ADD cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm .

CMD rpm -Uvh cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm

EXPOSE 57772 1972 22

WORKDIR /
ADD ccontainermain .
RUN chmod +x ccontainermain

ENTRYPOINT  ["/ccontainermain"]
