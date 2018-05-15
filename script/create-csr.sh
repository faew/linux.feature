# Copyright © 2018 Feature.su. All rights reserved.   
# Licensed under the Apache License, Version 2.0    

if [ -z $1  ]
then
echo "Usage for create CSR: sh create-csr.sh domain.name.without.www"
else
mkdir -p /tmp/$1/
openssl genrsa -out /tmp/$1/key 2048
openssl req -new -key /tmp/$1/key -out /tmp/$1/csr
cat /tmp/$1/csr
fi
