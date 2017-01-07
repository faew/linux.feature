# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

systemctl start firewalld
firewall-cmd --zone=public --change-interface=eth0
firewall-cmd --reload
systemctl enable firewalld
