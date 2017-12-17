# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active sshd`" != "active" ]   
then  
yum -y install openssh-server
systemctl start sshd
systemctl enable sshd
else 
echo "Warning: sshd already install" 
fi 
