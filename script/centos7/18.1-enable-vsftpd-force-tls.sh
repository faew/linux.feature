# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
chmod 400 /etc/vsftpd/vsftpd.pem
echo "" >> /etc/vsftpd/vsftpd.conf

echo "rsa_cert_file=/etc/vsftpd/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf
echo "rsa_private_key_file=/etc/vsftpd/vsftpd.pem" >> /etc/vsftpd/vsftpd.conf
echo "ssl_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "allow_anon_ssl=NO" >> /etc/vsftpd/vsftpd.conf
echo "force_local_data_ssl=YES" >> /etc/vsftpd/vsftpd.conf
echo "force_local_logins_ssl=YES" >> /etc/vsftpd/vsftpd.conf
echo "ssl_tlsv1=YES" >> /etc/vsftpd/vsftpd.conf
echo "ssl_sslv2=NO" >> /etc/vsftpd/vsftpd.conf
echo "ssl_sslv3=NO" >> /etc/vsftpd/vsftpd.conf
echo "require_ssl_reuse=NO" >> /etc/vsftpd/vsftpd.conf
echo "ssl_ciphers=HIGH" >> /etc/vsftpd/vsftpd.conf

systemctl restart vsftpd
