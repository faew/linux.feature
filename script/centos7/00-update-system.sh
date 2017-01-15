# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum update
sed -i "s/SELINUX=disabled/SELINUX=enforcing/g" /etc/selinux/config
reboot
