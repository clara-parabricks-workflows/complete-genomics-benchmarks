#!/bin/bash 

DOCKER_IMAGE="nvcr.io/nvidia/clara/clara-parabricks:4.4.0-1"
FASTQ_1="$1"
FASTQ_2="$2"
OUT_BAM="$(basename -s .fq.gz $FASTQ_1).bam"
OUT_VCF="$(basename -s .fq.gz $FASTQ_1).haplotype.vcf"
LOG_FILE="$(basename -s .fq.gz $FASTQ_1).fq2bam.germline.log"
RECAL_FILE="$(basename -s .fq.gz $FASTQ_1).recal.txt"

docker run --gpus all --rm \
   --env TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=268435456 \
    -v ${NVME_DIR}/data:/data \
    -v ${NVME_DIR}/tmp:/tmp \
   ${DOCKER_IMAGE} pbrun germline \
   --ref /data/ref/ucsc.hg19.fasta \
   --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
   --knownSites /data/ref/dbsnp_151.vcf.gz \
   --knownSites /data/ref/1000G_phase1.indels.hg19.sites.vcf.gz \
   --knownSites /data/ref/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz \
   --out-bam /data/outdir/${OUT_BAM} \
   --out-variants /data/outdir/${OUT_VCF} \
   --logfile /data/logs/${LOG_FILE} \
   --out-recal-file /data/outdir/${RECAL_FILE} \
   --run-partition --no-alt-contigs \
   --gpusort --gpuwrite \
   --tmp-dir /tmp --x3

   