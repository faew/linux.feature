# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

backup_dir="/backup/www"

mkdir -p $backup_dir
/usr/bin/rdiff-backup -b /var/www $backup_dir
/usr/bin/rdiff-backup --force --remove-older-than 7W $backup_dir
