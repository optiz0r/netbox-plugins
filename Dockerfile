FROM netboxcommunity/netbox:v3.2.6-ldap

RUN apk add --update-cache git && \
    rm -rf /var/cache/apk/*

COPY ./plugin_requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
