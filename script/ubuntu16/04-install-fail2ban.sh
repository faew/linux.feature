# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0  

if [ "`systemctl is-active fail2ban`" != "active" ]
then
apt-get -y install fail2ban
systemctl start fail2ban
systemctl enable fail2ban
else
echo "Warning: fail2ban already install"
fi
