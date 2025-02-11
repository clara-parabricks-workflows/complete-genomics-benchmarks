#!/bin/bash

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

# Check that the hardware is set 
if [[ -z $1 ]]; then
    echo "Missing hardware setting. Exiting."
    echo "./benchmark.sh L4"
    exit
fi

HARDWARE="$1"
BENCHMARK_PATH="./benchmarks/${HARDWARE}"

mkdir -p ${NVME_DIR}/tmp
mkdir -p ${NVME_DIR}/data/logs
mkdir -p ${NVME_DIR}/data/outdir

# ============================================================

# Sample T1Plus
FASTQ_1="30x_DL100002760_L01_NA12878_1.fq.gz"
FASTQ_2="30x_DL100002760_L01_NA12878_2.fq.gz"
BAM="$(basename -s .fq.gz $FASTQ_1).bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
${BENCHMARK_PATH}/deepvariant.sh ${BAM} 
