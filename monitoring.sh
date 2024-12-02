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
wall "
#Architeture: $ARCH
#Physical CPU's: $PHY_CPU
#vCPUS: $V_CPU
#Memory Usage: ${USED_RAM}mb/${TOTAL_RAM}mb ($PERCENT_RAM% in use)
#Disk Usage: TODO
#Cpu Rate %: TODO
#Last Boot: $LAST_BOOT
#LVM: $LVM_USE
#Active Conections: $CONNECTIONS
#IPV4/MAC: $IP ($MAC)
Total sudos: $SUDOS"
