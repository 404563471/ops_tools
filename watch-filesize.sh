#!/bin/bash -
#===============================================================================
#
#          FILE: watch-filesize.sh
#
#         USAGE: ./watch-filesize.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#  ORGANIZATION: Beijing Computing Center
#       CREATED: 01/19/2021 03:54:14 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

path=$1
while true
do
        log_time=$(date)
        disk_status=$(du -h --max-depth 0 $path)
        echo -e $log_time"\t"$disk_status >> ./info.txt
        du -h --max-depth 2 $path >> ./info.txt
        sleep 3h
done
