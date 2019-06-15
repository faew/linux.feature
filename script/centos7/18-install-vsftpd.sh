# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active vsftpd`" != "active" ]
then
yum -y install vsftpd
sed -i "s/anonymous_enable=YES/anonymous_enable=NO/g" /etc/vsftpd/vsftpd.conf
sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/g" /etc/vsftpd/vsftpd.conf
sed -i "s/listen=NO/listen=YES/g" /etc/vsftpd/vsftpd.conf
sed -i "s/listen_ipv6=YES/listen_ipv6=NO/g" /etc/vsftpd/vsftpd.conf
echo "" >> /etc/vsftpd/vsftpd.conf

echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=65000" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=65050" >> /etc/vsftpd/vsftpd.conf
echo "pasv_enable=Yes" >> /etc/vsftpd/vsftpd.conf

firewall-cmd --zone=public --add-port=21/tcp  --permanent
firewall-cmd --zone=public --add-port=65000-65050/tcp  --permanent
firewall-cmd --reload

setsebool -P ftpd_full_access on
setsebool -P ftpd_use_passive_mode on

systemctl enable vsftpd
systemctl start vsftpd

echo "" >> /etc/fail2ban/jail.d/customisation.local
echo "[vsftpd]" >> /etc/fail2ban/jail.d/customisation.local
echo "enabled = true" >> /etc/fail2ban/jail.d/customisation.local
echo "logpath = %(syslog_authpriv)s" >> /etc/fail2ban/jail.d/customisation.local
systemctl restart fail2ban

else
echo "Warning: vsftpd already install"
fi
