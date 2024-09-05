#!/bin/bash 

FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"

# STEP ONE: FQ2BAM 
docker run --rm --gpus all \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
    pbrun fq2bamfast \
    --ref /data/ref/Homo_sapiens_assembly38.fasta \
    --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
    --out-bam /outdir/out.bam \
    --low-memory

# STEP TWO: BAMMETRICS  
docker run --rm --gpus all \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
    pbrun bammetrics \
    --ref /data/ref/Homo_sapiens_assembly38.fasta \
    --bam /outdir/out.bam \
    --out-metrics-file /outdir/metrics.txt

