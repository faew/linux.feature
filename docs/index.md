---
layout: default
---

## [](#header-3)Philosophy 
* Minimalism
* One script = One task
* Do not disable OS security!

## [](#header-3)Step by step for CentOS 7
* Install core edition CentOS 7 
* Clone project
```shell
yum install git mc
cd /root
git clone https://github.com/faew/linux.feature.git
cd /root/linux.feature/script/centos7/
mc
```
* Update system and enable SELinux. System will be reboot.
```shell
sh 00-update-system.sh
```
* If the server has no swap file (on a small VPS/VDS with full virtualization).
```shell
sh 00.1-add-swap-file.sh 
```
* Installing the base utilities and initialize the password vault.
```shell
sh 01-install-utils.sh
```
* NTP in the new version
```shell
sh 02-install-chrony.sh
```
* Enable firewall, put first network interface into "public" zone.
```shell
sh 03-enable-firewall.sh
```
* Protect ssh
```shell
sh 04-install-fail2ban.sh
```
* Install Apache with virtualhost template (now only php).
```shell
sh 05-install-apache.sh
```
* Installation of the development packages to further compile the code.
```shell
sh 06-install-devel.sh
```
* Install php (now 5.4 in OS)
```shell
sh 07-install-php.sh
```
* Install mysql (now 5.7), run mysql_secure_installation, save root mysql password
```shell
sh 08-install-mysql.sh
```
* Install service for website acceleration
```shell
sh 09-install-sphinx.sh
sh 10-install-redis.sh
sh 11-install-memcached.sh
```
* Install php modules (for compile)
```shell
sh 12-install-php-imagick.sh
sh 13-install-php-opcache.sh
sh 14-install-php-intl.sh
sh 15-install-php-suhosin.sh
```
* Install programming languages
```shell
sh 16-install-python3.5.sh
sh 17-install-ruby2.3.sh
```
* Install FTP
```shell
sh 18-install-vsftpd.sh
sh 18.1-enable-vsftpd-force-tls.sh
```
* Install postgresql with md5 passwords
```shell
sh 19-install-postgresql.sh
```
* Compilation of Museum php versions in cgi mode
```shell
sh 20-compile-php-5.2.17.sh
sh 21-compile-php-5.1.6.sh
sh 22-compile-php-5.3.29.sh
sh 23-compile-php-5.0.5.sh
sh 24-compile-php-4.4.9.sh
```
* Monitoring agent for zabbix
```shell
sh 25-install-zabbix-agent.sh
```
* Install PhpMyAdmin
```shell
sh 26-install-phpmyadmin.sh
```
* Install rabbitmq
```shell
sh 27-install-rabbitmq.sh
```
* Installing powerDNS with the administrative panel
```shell
sh 28-install-pdns.sh
sh 29-install-poweradmin.sh
```
* Create new mysql Database. The password will be shown.
```shell
sh add-mysql-user.sh user_name_create_as_db_name
```
* Create web user. 
```shell
sh add-www-user.sh domain.name.without.www
# set password for ssh and ftp
# home forlder /var/www/domain.name.without.www/
# web root /var/www/domain.name.without.www/htdocs
passwd domain.name.without.www
```
