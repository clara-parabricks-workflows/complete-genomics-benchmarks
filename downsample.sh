#!/bin/bash

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

DATA_DIR="${NVME_DIR}/data"
SAMPLE_NAME="$(basename -s .fq.gz $1)"
DOWNSAMPLE_FRAC="$2"

gunzip ${DATA_DIR}/"${SAMPLE_NAME}.fq.gz"
seqtk sample -s100 "${DATA_DIR}/${SAMPLE_NAME}.fq" ${DOWNSAMPLE_FRAC} > ${DATA_DIR}/${SAMPLE_NAME}.30x.fq
gzip ${DATA_DIR}/${SAMPLE_NAME}.30x.fq