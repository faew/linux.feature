# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

if [ -z $1  ]
then
echo "Usage for create kvm vps: sh add-kvm-vps.sh NAME"
exit 0;
fi

if ! [ -e /dev/kvmlibvirt/$1 ]
then
echo "Create data disk for vps: lvcreate -n $1 -L10G kvmlibvirt"
exit 0;
fi

if ! [ -f /iso/$1.iso ]
then
echo "Create data start iso for vps: wget -O /iso/$1.iso http://mirror.yandex.ru/centos/7.4.1708/isos/x86_64/CentOS-7-x86_64-Minimal-1708.iso"
exit 0;
fi

wget -O /etc/libvirt/qemu/$1.xml https://raw.githubusercontent.com/faew/linux.feature/master/conf/centos7/kvm/libvirt-kvm.template
sed -i "s/___NAME___/$1/g" /etc/libvirt/qemu/$1.xml
sed -i "s/___UUID___/`uuidgen`/g" /etc/libvirt/qemu/$1.xml
sed -i "s/___MAC___/52:54:$(dd if=/dev/urandom count=1 2>/dev/null | md5sum | sed 's/^\(..\)\(..\)\(..\)\(..\).*$/\1:\2:\3:\4/')/g" /etc/libvirt/qemu/$1.xml
sed -i "s/___PASS___/`pwgen -A 15 1`/g" /etc/libvirt/qemu/$1.xml
virsh define /etc/libvirt/qemu/$1.xml
virsh start $1
virsh autostart $1
echo "Open spice from client"
cat /etc/libvirt/qemu/$1.xml | grep "<graphics"
echo ""
