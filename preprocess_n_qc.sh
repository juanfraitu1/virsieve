#!/bin/bash
# Made and mantained by Rosa Lab & Grozinger lab, Penn State University, PA
#Requisites: Trimmomatic, SRA-tools, Blast, HMMer,  Samtools, BBtools, seqtk
#May the odds be ever in your favor
#This command makes the script run in any path it is located
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
# Stop if any error is found
set -ueox pipefail

FILE_1=$1

FILE_2=$2

# Select Single end or paired end reads
if [ "$2" = 0 ] ; then
	echo 'SINGLE-END'

	mkdir -p $SCRIPTPATH/Qualities_Before

	#QC report
	fastqc $1 -o $SCRIPTPATH/Qualities_Before

	mkdir -p $SCRIPTPATH/Trimmed_Data

	# Quality control
	trimmomatic SE ${1} $SCRIPTPATH/Trimmed_Data/$(basename ${1%%.fastq})"_qc_passed.fq.gz" ILLUMINACLIP:Illuminadaptors.fa:2:30:10 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50


	#Quality check after
	mkdir -p $SCRIPTPATH/Qualities_After

	#QC report
	fastqc $SCRIPTPATH/Trimmed_Data/$(basename ${1%%.fastq}"_qc_passed.fq.gz")  -o $SCRIPTPATH/Qualities_After

else 
	echo 'PAIRED-END'

	mkdir -p $SCRIPTPATH/Qualities_Before

	#QC report
	fastqc $1 $2 -o $SCRIPTPATH/Qualities_Before

	mkdir -p $SCRIPTPATH/Trimmed_Data

	# Quality control
	trimmomatic PE $1 $2 $SCRIPTPATH/Trimmed_Data/$(basename ${1%%})".paired_qc_passed.fq.gz" $SCRIPTPATH/Trimmed_Data/${2%%}".paired_qc_passed.fq.gz" $SCRIPTPATH/Trimmed_Data/${1%.*}".unpaired_qc_passed.fq.gz" $SCRIPTPATH/Trimmed_Data/${2%.*}".unpaired_qc_passed.fq.gz"  TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50


	# Quality check after
	mkdir -p $SCRIPTPATH/Qualities_After

	#QC report
	fastqc $SCRIPTPATH/Trimmed_Data/${1}".paired_qc_passed.fq.gz" $SCRIPTPATH/Trimmed_Data/${2}".paired_qc_passed.fq.gz"  -o $SCRIPTPATH/Qualities_After


	#Merge Paired Ends
	pear -f $SCRIPTPATH/Trimmed_Data/${1%.*}".paired_qc_passed.fq.gz" -r $SCRIPTPATH/Trimmed_Data/${2%.*}".paired_qc_passed.fq.gz" -o $SCRIPTPATH/Trimmed_Data/${1%.*}"_qc_passed.fq.gz"

	fi







