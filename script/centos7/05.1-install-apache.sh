# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install mod_ssl
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
