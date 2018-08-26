#!/bin/bash
#PBS -l nodes=2:ppn=10
#PBS -l walltime=24:00:00
#PBS -A open
# Get started
echo "Job started on ‘hostname‘ at ‘date‘"
diamond makedb --in ~/scratch/Database/NR/nr -d ~/scratch/Database/NR/nr
# Finish up
echo "Job Ended at ‘date‘"

