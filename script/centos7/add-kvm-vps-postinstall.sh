# Copyright © 2018 Feature.su. All rights reserved
# Licensed under the Apache License, Version 2.0

if [ -z $1  ]
then
echo "Usage for postinstall kvm vps: sh add-kvm-vps-postinstall.sh NAME"
exit 0;
fi

sed -i "/device='cdrom/,/disk/d" /etc/libvirt/qemu/$1.xml
sed -i "s/cdrom/hd/g" /etc/libvirt/qemu/$1.xml
sed -i "/<graphics/,/graphics>/d" /etc/libvirt/qemu/$1.xml

virsh destroy $1
virsh define /etc/libvirt/qemu/$1.xml
virsh start $1
