#!/bin/bash 

DOCKER_IMAGE="nvcr.io/nvidia/clara/clara-parabricks:4.1.0-1"
FASTQ_1="$1"
FASTQ_2="$2"
OUT_BAM="$(basename -s .fq.gz $FASTQ_1).bam"
OUT_VCF="$(basename -s .fq.gz $FASTQ_1).vcf"
LOG_FILE="$(basename -s .fq.gz $FASTQ_1).log"

mkdir -p outdir

# L4 
docker run --gpus all --rm \
    --env TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=268435456 \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    ${DOCKER_IMAGE} pbrun germline \
    --ref /data/ref/ucsc.hg19.fasta \
    --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
    --knownSites /data/ref/dbsnp_151.vcf.gz \
    --knownSites /data/ref/1000G_phase1.indels.hg19.sites.vcf.gz \
    --knownSites /data/ref/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz \
    --out-bam /outdir/${OUT_BAM} \
    --out-variants /outdir/${OUT_VCF} \
    --logfile /outdir/${LOG_FILE} \
    --out-recal-file /outdir/recal.txt \
    --run-partition --no-alt-contigs \
    --gpusort --gpuwrite --low-memory

# H100
# For A100 and H100 we can optimize clock frequency
# sudo viking-cpu-freq.sh

#docker run --gpus all --rm \
#    --env TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=268435456 \
#    -v `pwd`/data:/data \
#    -v `pwd`/outdir:/outdir \
#    ${DOCKER_IMAGE} pbrun germline \
#    --ref /data/ref/ucsc.hg19.fasta \
#    --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
#    --knownSites /data/ref/dbsnp_151.vcf.gz \
#    --knownSites /data/ref/1000G_phase1.indels.hg19.sites.vcf.gz \
#    --knownSites /data/ref/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz \
#    --out-bam /outdir/${OUT_BAM} \
#    --out-variants /outdir/${OUT_VCF} \
#    --logfile /outdir/${LOG_FILE} \
#    --out-recal-file /outdir/recal.txt \
#    --run-partition --no-alt-contigs \
#    --gpusort --gpuwrite --bwa-cpu-thread-pool 16 
