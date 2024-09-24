#!/bin/bash 

# Note: $3 is reserved for "--use-wes-model"

DOCKER_IMAGE="nvcr.io/nvidia/clara/clara-parabricks:4.1.0-1"
IN_BAM="$1"
OUT_VCF="$(basename -s .bam $IN_BAM).deepvariant.vcf"
LOG_FILE="$(basename -s .bam $IN_BAM).deepvariant.log"
EXOME_FLAG="$2"
NVME_DIR="/opt/dlami/nvme"

docker run --gpus all --rm \
    --env TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=268435456 \
    -v ${NVME_DIR}/data:/data \
    -v ${NVME_DIR}/tmp:/tmp \
    ${DOCKER_IMAGE} pbrun deepvariant \
    --ref /data/ref/ucsc.hg19.fasta \
    --in-bam /data/outdir/${IN_BAM} \
    --out-variants /data/outdir/${OUT_VCF} \
    --run-partition \
    --num-streams-per-gpu 4 \
    --logfile /data/logs/${LOG_FILE} ${EXOME_FLAG} \
    --tmp-dir /tmp

