#!/bin/bash 

BAM="$1"
LOG_DIR="logs/bamstats"
LOG_FILE="${LOG_DIR}/$(basename -s .bam $BAM).bammetrics.txt"

mkdir -p ${LOG_DIR}

./bamstats -i outdir/${BAM} -o ${LOG_FILE}
