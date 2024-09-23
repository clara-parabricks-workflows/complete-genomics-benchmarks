#!/bin/bash 

FASTQ_1="$1"
FASTQ_2="$2"
OUT_BAM="$3"
LOG_FILE="$(basename -s .fq.gz $FASTQ_1).fq2bamfast.log"
PB_CONTAINER="nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1"

docker run --rm --gpus all \
    -v /opt/dlami/nvme/data:/data \
    -v /opt/dlami/nvme/outdir:/outdir \
    -v /opt/dlami/nvme/logs:/logs \
    -v /opt/dlami/nvme/tmp:/tmp \
    ${PB_CONTAINER} \
    pbrun fq2bamfast \
    --ref /data/ref/ucsc.hg19.fasta \
    --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
    --out-bam /outdir/${OUT_BAM} \
    --low-memory \
    --logfile /logs/${LOG_FILE} \
    --tmp-dir /tmp 
