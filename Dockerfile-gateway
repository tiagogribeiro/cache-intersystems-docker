FROM jjones028/apache-csp:latest
MAINTAINER Tiago G. Ribeiro <tiago.sistema@yahoo.com>

ADD CSP.ini /opt/cspgateway/bin/CSP.ini
RUN chmod 777 /opt/cspgateway/bin/CSP.ini

CMD ["/usr/sbin/httpd","-DFOREGROUND"]
