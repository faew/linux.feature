# Copyright © 2018 Feature.su. All rights reserved
# Licensed under the Apache License, Version 2.0  

if [ -z $1  ]
then
echo "Usage for long time command: sh long-time-command.sh \"cp -R /mnt/folder /var/folder\""
exit 0;
fi

nohup $1 &
