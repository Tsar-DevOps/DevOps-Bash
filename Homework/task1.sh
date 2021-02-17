#!/bin/bash
#FREE=`cat /proc/meminfo | grep MemFree: | awk '{print $2}'`
#FREE=`free -h | grep Mem: | awk '{print $4}' | head --bytes -2`

if [ $( grep 'MemFree:' /proc/meminfo | awk '{print $2}') -lt 1000000 ]; then 
   exit 1
fi
