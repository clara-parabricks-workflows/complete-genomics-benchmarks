#!/bin/bash 

# Note: Check that bamstats is in the PATH 

BAM="$1"
LOG_FILE="logs/$(basename -s .bam $BAM).bamstats.txt"

bamstats -i outdir/${BAM} -o ${LOG_FILE}