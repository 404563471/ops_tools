#!/bin/bash -
#===============================================================================
#
#          FILE: docker-group.sh
#
#         USAGE: ./docker-group.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#       CREATED: 05/15/2019 02:06:10 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

dockeruser=$1

if [ $USER != "root" ]; then
	echo "please change to root"
else
	groupadd docker
	gpasswd -a $dockeruser docker
	su $dockeruser && newgrp docker
	echo "successful"
fi
							   

