# Copyright © 2018 Feature.su. All rights reserved
# Licensed under the Apache License, Version 2.0 

if [ "`systemctl is-active tftp.socket`" != "active" ]  
then
yum install -y tftp-server tftp
firewall-cmd --add-service=tftp --permanent
firewall-cmd --reload
systemctl enable tftp.socket
systemctl start tftp.socket
echo "/var/lib/tftpboot/ - files for download"
else
echo "Warning: tftp-server already install" 
fi 
