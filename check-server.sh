#!/bin/bash

echo "cpu number:" `cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l`
echo `cat /proc/cpuinfo| grep "cpu cores"| uniq`
echo "processor number:" `cat /proc/cpuinfo| grep "processor"| wc -l`
echo "cpu name:" `cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c`

echo "super user:" `cat /etc/sudoers | grep ALL:ALL`
echo "kernal:" `uname -a`
ls /etc/issue &> /dev/null || echo "Linux version:" `cat /etc/redhat-release`
ls /etc/redhat-release &> /dev/null || echo "Linux version:" `cat /etc/issue`

echo `dmidecode | grep "Product Name"|uniq`
echo "memory size:" `cat /proc/meminfo | grep MemTotal`
