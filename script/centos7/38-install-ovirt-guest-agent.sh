# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active ovirt-guest-agent`" != "active" ]
then
yum -y install ovirt-guest-agent
systemctl enable ovirt-guest-agent
systemctl start ovirt-guest-agent
else
echo "Warning: ovirt-guest-agent already install"
fi
