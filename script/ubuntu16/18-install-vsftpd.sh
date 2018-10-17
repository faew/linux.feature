# Copyright © 2017 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

apt-get install vsftpd

sed -i "s/anonymous_enable=YES/anonymous_enable=NO/g" /etc/vsftpd.conf 
sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/g" /etc/vsftpd.conf 
sed -i "s/listen=NO/listen=YES/g" /etc/vsftpd.conf 
sed -i "s/listen_ipv6=YES/listen_ipv6=NO/g" /etc/vsftpd.conf 
echo "" >> /etc/vsftpd.conf 

echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 
echo "pasv_min_port=65000" >> /etc/vsftpd.conf 
echo "pasv_max_port=65050" >> /etc/vsftpd.conf 
echo "pasv_enable=Yes" >> /etc/vsftpd.conf 

firewall-cmd --zone=public --add-port=21/tcp  --permanent 
firewall-cmd --zone=public --add-port=65000-65050/tcp  --permanent 
firewall-cmd --reload

systemctl restart vsftpd
systemctl enable vsftpd 
