#!/bin/bash

# System info script for linux

echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "          SYSTEM INFORMATION REPORT           "
echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "Generated on: $(date)"
echo "----------------------------------------------"

echo "SYSTEM HOSTNAME"
hostname
echo "----------------------------------------------"

echo "OPERATING SYSTEM"
lsb_release -d | cut -f2-
echo "----------------------------------------------"

echo "TOTAL SYSTEM UPTIME"
uptime -p
echo "----------------------------------------------"

echo "LINUX KERNEL VERSION"
uname -r
echo "----------------------------------------------"

echo "CPU INFORMATION"
lscpu | grep -E 'Model name|Socket|Core|CPU\(s\)' | grep -v 'NUMA'
echo "----------------------------------------------"

echo "FREE MEMORY"
free -h
echo "----------------------------------------------"

echo "NETWORK INFORMATION"
echo "IP Addresses:"
ip -brief address show
echo "----------------------------------------------"
echo "MAC Addresses:"
ip link show | awk '/link\/ether/ {print $2}'
echo "----------------------------------------------"

echo "FILESYSTEM UTILIZATION"
df -hT
echo "----------------------------------------------"

echo "LAST 5 ERROR MESSAGES FROM SYSTEM LOG"
grep -i 'error' /var/log/syslog | tail -n 5
echo "----------------------------------------------"

echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
echo "               END OF REPORT                  "
echo "=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+"
