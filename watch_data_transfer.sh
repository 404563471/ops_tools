#!/bin/bash -
#===============================================================================
#
#          FILE: watch_data_transfer.sh
#
#         USAGE: ./watch_data_transfer.sh
#
#   DESCRIPTION: 
#参数分别代表：”文件夹地址“， ”运行命令“
#监听数据传输后运行命令脚本 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#       CREATED: 04/08/2020 01:37:44 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

dir=$1
command=$2

while true
do 
    size_1=`du -s $dir | awk '{print $1}'`
    sleep 10
    size_2=`du -s $dir | awk '{print $1}'`

    if [ $size_1 -eq $size_2 ]
    then
        echo "transfers successful! totol size is" $size_2
        break
    fi
#    echo $size_1 $size_2
    echo "still transfer"
done

#echo "hello world!"
bash $command

