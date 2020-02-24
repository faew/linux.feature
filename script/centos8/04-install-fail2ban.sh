# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active fail2ban`" != "active" ]
then
yum -y install fail2ban
echo "[sshd]" >  /etc/fail2ban/jail.d/customisation.local
echo "enabled = true" >>  /etc/fail2ban/jail.d/customisation.local
sed -i "s/= \/var\/lib\/fail2ban\/fail2ban.sqlite3/= None/g" /etc/fail2ban/fail2ban.conf
systemctl start fail2ban
systemctl enable fail2ban
else
echo "Warning: fail2ban already install"
fi
