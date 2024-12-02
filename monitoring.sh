#!/bin/bash

ARCH=$(uname -a)
PHY_CPU=$(grep "core id" /proc/cpuinfo | wc -l)
V_CPU=$(grep "processor" /proc/cpuinfo | wc -l)
TOTAL_RAM=$(free --mega | grep Mem | awk  '{print $2}')
USED_RAM=$(free --mega | grep Mem | awk  '{print $3}')
PERCENT_RAM=$(echo "scale=2; $USED_RAM * 100 / $TOTAL_RAM" | bc)
#DISKUSAGE
#CPU RATE
LAST_BOOT=$(who -b | awk '{print $3 " " $4}')

if [ $(lsblk | grep "lvm" | wc -l) = 0 ]; then
	LVM_USE="no"
else
	LVM_USE="yes"
fi
CONNECTIONS=$(ss -Ht state ESTABLISHED | wc -l)
IP=$(hostname -I | awk '{print $1}')
MAC=$(ip link show | grep "ether" | awk '{print $2}')
SUDOS=$(journalctl _COMM=sudo | grep COMMAND | wc -l)
echo "#Architeture: $ARCH"
echo "#Physical CPU's: $PHY_CPU"
echo "#vCPUS: $V_CPU"
echo "#Memory Usage: ${USED_RAM}mb/${TOTAL_RAM}mb ($PERCENT_RAM% in use) "
echo "#Disk Usage: TODO"
echo "#CPU rate %: TODO"
echo "#Last Boot: $LAST_BOOT"
echo "#LVM: $LVM_USE"
echo "#Active Conections: $CONNECTIONS"
echo "#IPV4/MAC: $IP ($MAC)"
echo "Total sudos: $SUDOS"

