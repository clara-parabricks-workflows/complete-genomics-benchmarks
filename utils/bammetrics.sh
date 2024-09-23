#!/bin/bash 

IN_BAM="$1"
EXOME_FLAG="$2"
OUT_METRICS="$(basename -s .bam $IN_BAM).bammetrics.txt"
PB_CONTAINER="nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1"
NVME_DIR="/opt/dlami/nvme"

docker run --rm --gpus all \
    -v ${NVME_DIR}/data:/data \
    -v ${NVME_DIR}/outdir:/outdir \
    -v ${NVME_DIR}/logs:/logs \
    -v ${NVME_DIR}/tmp:/tmp \
    ${PB_CONTAINER} \
    pbrun bammetrics \
    --ref /data/ref/ucsc.hg19.fasta \
    --bam /outdir/${IN_BAM} \
    --out-metrics-file /logs/${OUT_METRICS} \
    ${EXOME_FLAG} \
    --tmp-dir /tmp 
