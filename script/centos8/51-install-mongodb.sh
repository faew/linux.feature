# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

if [ "`systemctl is-active mongod`" != "active" ]
then
echo "[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc
" > /etc/yum.repos.d/mongodb-org-4.2.repo

yum install -y mongodb-org

cd /tmp
echo "module mongodb_cgroup_memory 1.0;

require {
    type cgroup_t;
    type mongod_t;
    class dir search;
    class file { getattr open read };
}

#============= mongod_t ==============
allow mongod_t cgroup_t:dir search;
allow mongod_t cgroup_t:file { getattr open read };
" > mongodb_cgroup_memory.te

checkmodule -M -m -o mongodb_cgroup_memory.mod mongodb_cgroup_memory.te
semodule_package -o mongodb_cgroup_memory.pp -m mongodb_cgroup_memory.mod
semodule -i mongodb_cgroup_memory.pp

sed -i "s/^#replication:/replication:\n  replSetName: rs01/" /etc/mongod.conf

systemctl enable mongod
systemctl start mongod

mongo --eval "printjson(rs.initiate())"

else
echo "Warning: MongoDB already install"
fi
