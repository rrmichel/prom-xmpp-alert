#!/bin/sh

envtpl < /xmpp-alerts.yml.tpl > /xmpp-alerts.yml

python3 prometheus-xmpp-alerts/prometheus-xmpp-alerts --config /xmpp-alerts.yml