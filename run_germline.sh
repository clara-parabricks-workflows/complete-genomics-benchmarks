#!/bin/bash 

# Run bwa+hc4.2 using hg19 reference
DOCKER_IMAGE="nvcr.io/nvidia/clara/clara-parabricks:4.1.0-1"
FASTQ_1="$0"
FASTQ_2="$1"
OUT_BAM="$2"
OUT_VARIANTS="$3"
LOG_FILE="$4"
RECAL_FILE="$5"

mkdir -p outputdir

docker run -d --gpus all --rm \
    -v `pwd`/data:/input_data \
    -v `pwd`/outputdir:/outputdir \
    -v `pwd`/ref:/ref \
    ${DOCKER_IMAGE} pbrun germline \
    --ref /ref/hg19.fa \
    --in-fq /input_data/${FASTQ_1} /input_data/${FASTQ_2} \
    --knownSites /ref/dbsnp_151.vcf.gz \
    --knownSites /ref/1000G_phase1.indels.hg19.vcf.gz \
    --knownSites /ref/Mills_and_1000G_gold_standard.indels.hg19.vcf.gz \
    --out-bam /outputdir/${OUT_BAM} \
    --out-variants /outputdir/${OUT_VARIANTS} \
    --logfile /outputdir/${LOG_FILE} \
    --out-recal-file /outputdir/${RECAL_FILE} \
    --run-partition --no-alt-contigs \
    --gpusort --gpuwrite 