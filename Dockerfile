# Caché Intersystens in Docker Container
# Caché Intersystems em Docker Container.
FROM centos:latest
MAINTAINER Tiago G. Ribeiro <tiago.sistema@yahoo.com>

ENV TMP_INSTALL_DIR=/tmp/distrib
ENV ISC_PACKAGE_INSTALLDIR="/usr/cachesys"

RUN mkdir ${TMP_INSTALL_DIR}
WORKDIR ${TMP_INSTALL_DIR}

#Detalhe contribuído por Lucas Assis. Fernandes - Valeu o/
#Detail contributed of Lucas Assis. Fernandes - Thanks 0/
ADD functions /etc/init.d/

#A versão do Caché a ser instalado.
#The version of the cache to be installed
ADD cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm .
RUN rpm -iUhv cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm
RUN rm cache-server-2016.1.1.108.0su-1.rh.x86_64.rpm

# Inicia o primeiro start.
# The first initialization
RUN /etc/init.d/cache start
RUN /etc/init.d/cache stop

# https://github.com/zrml/ccontainermain
WORKDIR /
ADD ccontainermain .
RUN chmod +x ccontainermain

EXPOSE 57772 1972 22

ENTRYPOINT  ["/ccontainermain"]

# Iniciar o container do Caché, utilize:
# docker run <imagem>
# Outras opções de inicialização, veja no projeto: https://github.com/zrml/ccontainermain
#
# Initialization the container of Caché, use:
# docker run <image>
# Other options in initialization, view in project: https://github.com/zrml/ccontainermain
