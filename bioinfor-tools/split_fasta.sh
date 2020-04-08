sequences=$1
step=$2
awk -v a=$step 'BEGIN {n_seq=0;} /^>/ {if(n_seq % a==0){file=sprintf("myseq%d.fa",n_seq);} print >> file; n_seq++; next;} { print >> file; }' < $sequences
