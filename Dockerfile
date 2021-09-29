FROM python:3-slim

RUN mkdir -p /opt/plexconnect
RUN pip install wget
RUN python -m wget -o plexconnect.tar.gz https://github.com/dlgoodr/PlexConnect/archive/refs/heads/py3.tar.gz
RUN tar -C /opt/plexconnect -xvf plexconnect.tar.gz --strip-components 1
RUN mkdir -p /opt/plexconnect/assets/certificates

EXPOSE 80 443

CMD ["python", "/opt/plexconnect/PlexConnect.py", "--config_path=./config"]
