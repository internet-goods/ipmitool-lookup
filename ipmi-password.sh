#!/bin/bash
for i in `cat ipmi.txt`; do 
#turn off anonymous user 1
ipmitool -H $i -U ADMIN -P ADMIN channel setaccess 1 1 link=off callin=off privilege=15
#reset ADMIN access user 2
ipmitool -H $i -U ADMIN -P ADMIN user set password 2 anythingotherthanadmin 
done
