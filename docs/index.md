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
