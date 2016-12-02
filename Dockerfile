# Version: 0.0.1
FROM shawks03/sparktitantests

MAINTAINER Andrew Lloyd

COPY ./scripts /scripts

COPY localTitan/mygraph.properties /opt/titan/conf

