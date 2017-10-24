# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

cd /tmp
wget http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-agent-3.4.3-1.el7.x86_64.rpm
rpm -i zabbix-agent-3.4.3-1.el7.x86_64.rpm
systemctl enable zabbix-agent
setsebool -P zabbix_can_network=1
systemctl start zabbix-agent
echo "Config: /etc/zabbix/zabbix_agentd.conf"

# if use spec port
# semanage port -a -t zabbix_port_t -p tcp 10501

# open agent port
# firewall-cmd --permanent --zone=public --add-port=10050/tcp
# firewall-cmd --reload
