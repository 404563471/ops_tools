#!/bin/bash
# chack the submitted jobs of current user, save result to current folder named "the_user_all_program_in_computer.log"
# queue is "队列名称"
# host is "节点名称"
queue=$1
host=$2
program="the_user_all_program_in_computer.log"
bsub -q $queue -m $host -o $program "ps aux | grep $USER"
