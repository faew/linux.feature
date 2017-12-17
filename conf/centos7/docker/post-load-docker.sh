# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

sh /root/linux.feature/script/centos7/03-enable-firewall.sh
systemctl restart fail2ban
sh /root/linux.feature/script/centos7/08.2-set-pass-mysql.sh `pwgen -y 12 1`
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload
