#!/bin/bash 

# Note: Check that bamstats is in the PATH 

BAM="$1"
NVME_DIR="/opt/dlami/nvme"
BAM_PATH="${NVME_DIR}/outdir/${BAM}"
LOG_FILE="${NVME_DIR}/logs/$(basename -s .bam $BAM).bamstats.txt"

bamstats -i ${BAM_PATH} -o ${LOG_FILE}
