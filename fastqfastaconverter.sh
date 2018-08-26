#!/bin/bash
# Made and mantained by Rosa Lab & Grozinger lab, Penn State University, PA
#Requisites: Trimmomatic, SRA-tools, Blast, HMMer,  Samtools, BBtools, seqtk
#May the odds be ever in your favor
#This command makes the script run in any path it is located
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
# Stop if any error is found
set -ueox pipefail

FILE_1=$1
#Convert Fastq to Fasta
seqtk seq -a $SCRIPTPATH/Trimmed_Data/${1%%.fastq}"_qc_passed.fq.gz" > DIR/${1%%.fastq}".fasta"
