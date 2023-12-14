FROM netboxcommunity/netbox:v3.6-2.7.0

RUN apt-get update && apt install -y git && \
    rm -rf /var/lib/apt/lists/*

COPY ./plugin_requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt
RUN SECRET_KEY="dummy-secret-key-34ed6d68-fab4-42b8-94d8-d90bba4f8458" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
