#!/bin/bash 

IN_BAM="$1"
OUT_METRICS="$(basename -s .fq.gz $FASTQ_1).bammetrics.txt"
PB_CONTAINER="nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1"

docker run --rm --gpus all \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    -v `pwd`/logs:/logs \
    ${PB_CONTAINER} \
    pbrun bammetrics \
    --ref /data/ref/ucsc.hg19.fasta \
    --bam /outdir/${IN_BAM} \
    --out-metrics-file /logs/${OUT_METRICS}
