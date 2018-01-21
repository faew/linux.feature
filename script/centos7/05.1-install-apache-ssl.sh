# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install mod_ssl
sed -i "s/Listen 443 https/Listen 0.0.0.0:443/g" /etc/httpd/conf.d/ssl.conf
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload

echo "Use VHostSSL empty.local" >> /etc/httpd/conf.modules.d/11-domains.conf
cp /etc/pki/tls/certs/localhost.crt /etc/pki/tls/certs/empty.local.crt
cp /etc/pki/tls/private/localhost.key /etc/pki/tls/private/empty.local.key
cp /etc/pki/tls/certs/localhost.crt /etc/pki/tls/certs/empty.local-chain.crt
systemctl restart httpd
