#!/bin/bash -
#===============================================================================
#
#          FILE: check-safe.sh
#
#         USAGE: ./check-safe.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#  ORGANIZATION: Beijing Computing Center
#       CREATED: 12/04/2020 02:57:40 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
## 查看用户密码最长天数
if [ -f /etc/login.defs ];then
	echo -e "###################"  
	echo -e 查看用户密码最长天数: \\n
    sed -n /^PASS_MAX_DAYS/p /etc/login.defs
    sed -n /^PASS_MIN_DAYS/p /etc/login.defs
    sed -n /^PASS_WARN_AGE/p /etc/login.defs
	echo -e "###################"  
fi

## 查看用户是否存在空密码
if [ -f /etc/shadow ];then
	echo -e \\n
	echo -e "###################"  
	echo -e 查看用户是否存在空密码: \\n
	empty_user_name=`awk -F: '($2 == "") { print $1 }' /etc/shadow`

	if [ $empty_user_name="" ];then
		echo "不存在空密码用户"
	else
		echo "空密码用户为：" $empty_user_name
	fi
	echo -e "###################"  
fi
