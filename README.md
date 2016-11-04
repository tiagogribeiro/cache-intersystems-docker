# Docker-Cache-Intersystems
Caché Intersystens in Docker Container

https://hub.docker.com/r/tiagoribeiro/cache-database/

# New version
Structure in two containers, one for gateway other database.
Using docker-compose for build and execution

Is necessary **docker enginer** and **docker-compose.**

**You must download Caché Server(cache-2016.2.0.736.0su-lnxrhx64.tar.gz) and adding in directory of project and before executing**<br>
$ docker-compose build<br>
$ docker-compose up<br>

Access portal for configuration in http://172.16.0.2/csp/sys/utilHome.csp


