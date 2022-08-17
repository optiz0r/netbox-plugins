FROM netboxcommunity/netbox:v3.2.9-2.1.0

RUN apt-get update && apt install -y git && \
    rm -rf /var/lib/apt/lists/*

COPY ./plugin_requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
