# Copyright © 2019 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

yum -y install http://download.zfsonlinux.org/epel/zfs-release.el7_`cat /etc/redhat-release | awk -F"." '{print $2}'`.noarch.rpm

# ebable zfs-kmod, disable zfs
sed -i "0,/enabled=0/s/enabled=0/enabled=1/" /etc/yum.repos.d/zfs.repo
sed -i "0,/enabled=1/s/enabled=1/enabled=0/" /etc/yum.repos.d/zfs.repo

yum -y install zfs
