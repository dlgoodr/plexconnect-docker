FROM python:3.10.0-slim

RUN mkdir -p /opt/plexconnect
RUN pip install wget
RUN python -m wget -o plexconnect.tar.gz https://github.com/dlgoodr/PlexConnect/archive/refs/heads/py3.tar.gz
RUN tar -C /opt/plexconnect -xvf plexconnect.tar.gz --strip-components 1
RUN pip install -r /opt/plexconnect/requirements.txt
RUN mkdir -p /opt/plexconnect/assets/certificates

EXPOSE 80 443 53 53/udp

CMD ["python", "/opt/plexconnect/PlexConnect.py", "--config_path=./config"]
