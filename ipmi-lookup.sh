#!/bin/bash
RUNDATE="$(date "+%Y-%m-%d")"
#for i in `smcip`; do ipmitool -H $i -U ADMIN -P $SMCOLD user set password 2 $SMCNEW; done
#mc info = firmware  same as bmc info
#chassis status
#sdr list = temp
#fru
mkdir $RUNDATE
cd $RUNDATE
for i in `cat ../ipmi.txt`; do 
ipmitool -H $i -U ADMIN -P ADMIN user list > $i.IPMI.user.list.txt 
ipmitool -H $i -U ADMIN -P ADMIN chassis status > $i.IPMI.chassis.status.txt 
ipmitool -H $i -U ADMIN -P ADMIN fru > $i.IPMI.fru.txt
ipmitool -H $i -U ADMIN -P ADMIN bmc info > $i.IPMI.bmc.info.txt
done

