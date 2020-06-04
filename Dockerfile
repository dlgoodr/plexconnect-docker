FROM alpine:latest

RUN apk add --no-cache python2

RUN mkdir -p /opt/plexconnect
RUN wget https://github.com/dlgoodr/PlexConnect/archive/configpath.tar.gz
RUN tar -C /opt/plexconnect -xvf configpath.tar.gz --strip-components 1
RUN mkdir -p /opt/plexconnect/assets/certificates

EXPOSE 80 443

CMD ["/usr/bin/python2", "/opt/plexconnect/PlexConnect.py", "--config_path=./config"]
