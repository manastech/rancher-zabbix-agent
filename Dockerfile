FROM zabbix/zabbix-agent

RUN apk add --no-cache curl jq docker sudo

ADD zabbix_agentd.d/*.conf /etc/zabbix/zabbix_agentd.d/
ADD sudoers.d/* /etc/sudoers.d/
ADD rancher-entrypoint.sh /usr/bin/

RUN chmod 0440 /etc/sudoers.d/*
RUN chmod 0755 /usr/bin/rancher-entrypoint.sh

CMD ["rancher-entrypoint.sh"]
