#!/bin/bash 

FASTQ_1="$0"
FASTQ_2="$1"

# STEP ONE: FQ2BAM 
docker run --rm --gpus all \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
    pbrun fq2bamfast \
    --ref /data/ref/Homo_sapiens_assembly38.fasta \
    --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
    --out-bam /outdir/out.bam \

# STEP TWO: BAMMETRICS  
docker run --rm --gpus all \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
    pbrun bammetrics \
    --ref /data/ref/Homo_sapiens_assembly38.fasta \
    --bam /outdir/out.bam \
    --out-metrics-file /outdir/metrics.txt

# STEP THREE: DOWNSAMPLE 
# seqtk sample -s100 read1.fq 10000 > sub1.fq
# seqtk sample -s100 read2.fq 10000 > sub2.fq