#!/bin/bash -
#===============================================================================
#
#          FILE: new_8tb.sh
#
#         USAGE: ./new_8tb.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yuan Hanyu (Bioinformatics Engineer), yhy.119@foxmail.com
#  ORGANIZATION: Beijing Computing Center
#       CREATED: 09/27/2020 03:58:38 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

new_parted=$1

parted -s -a optimal $new_parted mklabel gpt -- mkpart primary ext4 1 -1
wait
mkfs.ext4 ${new_parted}1
