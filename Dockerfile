FROM python:2-slim

RUN mkdir -p /opt/plexconnect
RUN pip install wget
RUN python2 -m wget -o plexconnect.tar.gz https://github.com/iBaa/PlexConnect/archive/master.tar.gz
RUN tar -C /opt/plexconnect -xvf plexconnect.tar.gz --strip-components 1
RUN mkdir -p /opt/plexconnect/assets/certificates

EXPOSE 80 443

CMD ["python2", "/opt/plexconnect/PlexConnect.py", "--config_path=./config"]
