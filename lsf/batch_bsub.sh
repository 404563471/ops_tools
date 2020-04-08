#!/bin/bash
# Treat unset variables as an error
set -o nounset                                  
# usage: ./batch_bsub.sh *.lsf
busb_scripts=$@
for single_jobs in $busb_scripts
do
        echo "submit the job: " $single_jobs
        bsub < $single_jobs
done

