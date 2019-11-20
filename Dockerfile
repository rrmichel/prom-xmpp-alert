FROM python:3-alpine

LABEL build="Wed 20 Nov 2019 10:02:34 PM CET"

RUN apk update \ 
	&& apk add -t build-dependencies build-base
RUN apk add git tini libffi-dev

RUN git clone https://github.com/jelmer/prometheus-xmpp-alerts.git prometheus-xmpp-alerts
RUN pip install -e ./prometheus-xmpp-alerts/
RUN pip3 install --no-cache-dir envtpl

COPY start.sh /
COPY xmpp-alerts.yml.tpl /

ENV XMPP_jid="alertmanager@example.com" \
	XMPP_password="PASSWORD" \
	XMPP_listen_address="127.0.0.1" \
	XMPP_listen_port=9199 \
	XMPP_to_jid="user@example.com" \
	XMPP_format="full"

EXPOSE 9199

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/start.sh"]
