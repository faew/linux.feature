# Copyright © 2018 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0 

PASS=`pwgen 12 1`
echo -n $PASS | passwd --stdin root
echo -n $PASS
