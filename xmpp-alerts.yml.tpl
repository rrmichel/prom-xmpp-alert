{% for key, value in environment('XMPP_') %}{{ key|replace('_', '_') }}: {{ value }}
{% endfor %}