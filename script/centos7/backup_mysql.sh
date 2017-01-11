# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

sqluser="root"
sqlpass="root_mysql_password"
backup_dir="/backup/mysql"
cdate=`date +%F`
tdaydir="$backup_dir/$cdate"

mkdir -p $tdaydir
for i in `find /var/lib/mysql -type d | gawk -F "/" '{print $5}'`
do
    mysqldump -R -u$sqluser -p$sqlpass $i > "$tdaydir/$i.sql"
done
cd $backup_dir
tar --remove-files -cPjf "$backup_dir/mysql_$cdate.tar.bz2" "$cdate"
rm -f $backup_dir/mysql_`date -d "7 days ago" "+%F"`.tar.bz2
