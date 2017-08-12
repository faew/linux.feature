# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

# ls -Z /usr/bin/systemd-nspawn
# -rwxr-xr-x. root root system_u:object_r:bin_t:s0       /usr/bin/systemd-nspawn
# https://www.centos.org/forums/viewtopic.php?t=57044
# https://bugzilla.redhat.com/show_bug.cgi?id=1391118

# selinux fix systemd-nspawn
chcon -t virtd_lxc_exec_t /usr/bin/systemd-nspawn

# disable network-veth
cp /usr/lib/systemd/system/{systemd-nspawn@,systemd-nspawn-online@}.service
sed -i "s/--network-veth //" /usr/lib/systemd/system/systemd-nspawn-online@.service
