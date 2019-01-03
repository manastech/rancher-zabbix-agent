FROM zabbix/zabbix-agent

RUN apk add --no-cache curl jq

ADD lbdiscovery.conf /etc/zabbix/zabbix_agentd.d/lbdiscovery.conf
