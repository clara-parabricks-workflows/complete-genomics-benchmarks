#!/bin/bash 

DOCKER_IMAGE="nvcr.io/nvidia/clara/clara-parabricks:4.1.0-1"
OUT_BAM="$1"
OUT_VCF="$(basename -s .bam $OUT_BAM).deepvariant.vcf"
LOG_FILE="$(basename -s .bam $OUT_BAM).deepvariant.log"

mkdir -p outdir

# L4 
docker run --gpus all --rm \
    --env TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=268435456 \
    -v `pwd`/data:/data \
    -v `pwd`/outdir:/outdir \
    ${DOCKER_IMAGE} pbrun germline \
    --ref /data/ref/ucsc.hg19.fasta \
    --in-bam /outdir/${IN_BAM} \
    --out-variants /outdir/${OUT_VCF} \
    --run-partition \
    --num-streams-per-gpu 4 \
    --low-memory \
    --logfile /outdir/${LOG_FILE} 

# H100
# For A100 and H100 we can optimize clock frequency
#sudo viking-cpu-freq.sh

#docker run --gpus all --rm \
#    --env TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=268435456 \
#    -v `pwd`/data:/data \
#    -v `pwd`/outdir:/outdir \
#    ${DOCKER_IMAGE} pbrun germline \
#    --ref /data/ref/ucsc.hg19.fasta \
#    --in-bam /outdir/${IN_BAM} \
#    --out-variants /outdir/${OUT_VCF} \
#    --run-partition \
#    --num-streams-per-gpu 4 \
#    --low-memory \
#    --logfile /outdir/${LOG_FILE} \
#    --num-cpu-threads-per-stream 16 \
#    --run-partition \
#    --read-from-tmp-dir \
#    --num-streams-per-gpu 4 \
#    --keep-tmp 
