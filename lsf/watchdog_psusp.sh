#!/bin/bash
# 用以在后台持续监控任务状态，定时抢救挂起任务
# usage: nohup watchdog_psusp.sh &
while [[ 0 -eq 0 ]]
do
	bjobs | sed -n /PSUSP/p |awk '{print "bresume "$1";"}'| bash
	sleep 2700
done
