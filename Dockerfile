FROM zabbix/zabbix-agent

RUN apk add --no-cache curl jq docker sudo

ADD zabbix_agentd.d/*.conf /etc/zabbix/zabbix_agentd.d/
ADD sudoers.d/* /etc/sudoers.d/

RUN chmod 0440 /etc/sudoers.d/*
