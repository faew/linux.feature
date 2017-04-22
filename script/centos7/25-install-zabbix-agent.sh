# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /tmp
wget http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-agent-3.2.4-2.el7.x86_64.rpm
rpm -i zabbix-agent-3.2.4-2.el7.x86_64.rpm
systemctl enable zabbix-agent
systemctl start zabbix-agent
cd /var/log/audit
cat /var/log/audit/audit.log | grep zabbix_agentd | grep denied | audit2allow -M zabbix_agent_setrlimit
semodule -i zabbix_agent_setrlimit.pp
setsebool -P zabbix_can_network=1
systemctl restart zabbix-agent
echo "Config: /etc/zabbix/zabbix_agentd.conf"
