# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 
  
if [ "`systemctl is-active firebird-superclassic`" != "active" ]
then
yum install firebird firebird-devel firebird-superclassic

systemctl enable firebird-superclassic
systemctl start firebird-superclassic

SYSDBA=`pwgen -y 8 1`
echo -n $SYSDBA > /etc/linux.feature/firebird-pwd
gsec -user sysdba -password masterkey -modify sysdba -pw $SYSDBA

else
echo "Warning: firebird already install"
fi
