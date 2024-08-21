#!/bin/bash 

DOCKER_IMAGE="nvcr.io/nvidia/clara/clara-parabricks:4.1.0-1"
FASTQ_1="$0"
FASTQ_2="$1"
LOG_FILE="$2"

docker run -d --gpus all --rm \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    ${DOCKER_IMAGE} pbrun germline \
    --ref /data/ref/Homo_sapiens_assembly38.fasta \
    --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
    --knownSites /data/ref/Homo_sapiens_assembly38.dbsnp138.vcf \
    --knownSites /data/ref/1000G_phase1.snps.high_confidence.hg38.vcf.gz \
    --knownSites /data/ref/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz \
    --out-bam /outdir/out.bam \
    --out-variants /outdir/out.vcf \
    --logfile /outdir/${LOG_FILE} \
    --out-recal-file /outdir/recal.txt \
    --run-partition --no-alt-contigs \
    --gpusort --gpuwrite 