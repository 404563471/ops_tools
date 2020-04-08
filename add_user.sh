#!/bin/bash -
#===============================================================================
#
#          FILE: add_user.sh
#
#         USAGE: ./add_user.sh
#
#   DESCRIPTION: 
#参数分别为“用户名前缀”、“密码前缀”、“总数”
#some example : sudo ./add-user3.0.sh test \!\@\# 12
#TODO how to remove this when delete the user: userdel: warning: can't remove /var/mail/test5: No such file or directory
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#       CREATED: 04/08/2020 01:33:46 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
user_prefix=$1
password_prefix=$2
totals=$3
user_home=/home

if [ -f del_user.sh ];then
        echo "please check the del_user.sh and delete it"
        exit 1
fi

touch del_user.sh
chmod a+x del_user.sh
echo "#!/bin/bash" >> del_user.sh

user_totals=`seq 1 $totals`
for i in $user_totals
do
        username=$user_prefix$i
        password=$password_prefix$i
        useradd -m -d $user_home/$username -s /bin/bash $username 
        echo "$username:$password" | chpasswd
        echo "username is $username, password is $password"

        echo userdel -r -f $username >> del_user.sh
        echo echo "The $username deletc success !" >> del_user.sh 

done

echo echo "please check the user delete and remove the del_user.sh" >> del_user.sh

echo "produce the user delete script called del_user.sh, you can use it when you want to delete these user or rename this script manually"
