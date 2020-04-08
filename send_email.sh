#!/bin/bash -
#===============================================================================
#
#          FILE: send_email.sh
#
#         USAGE: ./send_email.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#       CREATED: 04/08/2020 01:31:07 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

title="job reports"
email="404563471@qq.com"

command=$1
report_name=$2
report="/home/yhy/report/$report_name.report"

touch "$report"
bash -c $command > "$report" 2>&1 
if [ $? -ne 0  ]; then
	echo "$report_name failed" | mail -s "$title" "$email"
else
	echo "$report_name success" | mail -s "$title" "$email"
fi
