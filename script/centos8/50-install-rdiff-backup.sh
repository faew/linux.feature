# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if ! [ -d /usr/lib64/python2.7/site-packages/rdiff_backup ]
then
yum -y install python2-devel librsync-devel
cd /tmp
git clone -b v1.2.x https://github.com/rdiff-backup/rdiff-backup.git
cd rdiff-backup/rdiff-backup
cp ./dist/setup.py ./setup.py
cp ./rdiff_backup/*.c ./
sed -i "s/env python/env python2/g" setup.py
sed -i "s/FAQ.html/FAQ-body.html/g" setup.py
sed -i "s/\$version/v1.2.9/g" setup.py
sed -i "s/\$version/v1.2.9/g" ./rdiff_backup/Globals.py
./setup.py build
./setup.py install
else
echo "Warning: rdiff-backup exists";
fi
