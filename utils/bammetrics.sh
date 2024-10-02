#!/bin/bash 

IN_BAM="$1"
EXOME_FLAG="$2"
OUT_METRICS="$(basename -s .bam $IN_BAM).bammetrics.txt"
PB_CONTAINER="nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1"

docker run --rm --gpus all \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    -v `pwd`/logs:/logs \
    ${PB_CONTAINER} \
    pbrun bammetrics \
    --ref /data/ref/ucsc.hg19.fasta \
    --bam /outdir/${IN_BAM} \
    --out-metrics-file /logs/${OUT_METRICS} \
    ${EXOME_FLAG}