# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum install fail2ban
echo "[sshd]" >  /etc/fail2ban/jail.d/customisation.local
echo "enabled = true" >>  /etc/fail2ban/jail.d/customisation.local
mkdir /var/run/fail2ban
chmod 644 /var/run/fail2ban
restorecon -v /var/run/fail2ban
systemctl start fail2ban
systemctl enable fail2ban
