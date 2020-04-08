#!/bin/bash -
#===============================================================================
#
#          FILE: watch_virus.sh
#
#         USAGE: ./watch_virus.sh
#
#   DESCRIPTION: 
#固定杀死字符为6位随机名称的进程（已排除python）
#TODO umount这种也需要添加排除
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#       CREATED: 04/08/2020 01:41:14 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

file_name="/home/yhy/shell_script/watchMD.log"

echo `date` = NUM = PID > $file_name
while true
do
 proc_name=`ps aux | awk '{print $11}' | egrep "^\w{6}$"`
 num=`pgrep -x "$proc_name" | wc -l`
 if [ $proc_name="python" ]
 then
    num=0
 fi

 if [ 0 -lt $num ]
 then
    pid=`pgrep -x "$proc_name"`
    ps -ef | grep $pid | grep -v grep >> $file_name
    echo == >> $file_name
    par=(`ps -ef | grep $pid | grep -v grep | awk '{print $3}'`)
    ps -ef | grep ${par[0]} | grep -v grep >> $file_name
    echo ==== >> $file_name
    kill $pid
    echo `date` =  $num  = $pid >> $file_name
 fi
 sleep 2
done
