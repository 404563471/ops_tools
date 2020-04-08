#!/bin/bash -
#===============================================================================
#
#          FILE: mydocker.sh
#
#         USAGE: ./mydocker.sh
#
#   DESCRIPTION: 
#使用时需在总目录下（如/data），可根据实际修改path的赋值；
#位置参数1可传入docker-compose对应参数（ps，logs，start， stop）
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#       CREATED: 04/08/2020 01:23:13 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

path=/data
project=(123-biomedical  baiyi2019  hunanshida_fish  peibo-ps  shanshu2019  webstation)
what_to_do=$1

for i in ${project[@]}
do
	cd  $path/$i
	echo -e "\n\n\n============\033[33m $i \033[0m============="
	docker-compose $what_to_do
done
