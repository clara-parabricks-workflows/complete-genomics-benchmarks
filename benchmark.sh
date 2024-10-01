#!/bin/bash

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    exit
fi

HARDWARE="$1"
BENCHMARK_PATH="./benchmarks/${HARDWARE}"

mkdir -p ${NVME_DIR}/tmp
mkdir -p ${NVME_DIR}/data/logs
mkdir -p ${NVME_DIR}/data/outdir

# ============================================================

# Sample T7 - WGS
FASTQ_1="E100030471QC960_L01_48_1.30x.fq.gz"
FASTQ_2="E100030471QC960_L01_48_2.30x.fq.gz"
BAM="$(basename -s .fq.gz $FASTQ_1).bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
${BENCHMARK_PATH}/deepvariant.sh ${BAM} 

# ============================================================

# Sample T7 - WES
FASTQ_1="T7_PE150_NA12878_WES_sample4_1.fq.gz"
FASTQ_2="T7_PE150_NA12878_WES_sample4_2.fq.gz"
BAM="$(basename -s .fq.gz $FASTQ_1).bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
${BENCHMARK_PATH}/deepvariant.sh ${BAM} "--use-wes-model"

# ============================================================

# Sample G400 - WES
FASTQ_1="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz"
FASTQ_2="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz"
BAM="$(basename -s .fq.gz $FASTQ_1).bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
${BENCHMARK_PATH}/deepvariant.sh ${BAM} "--use-wes-model"

# ============================================================

# Sample G400 - WGS
FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
BAM="$(basename -s .fq.gz $FASTQ_1).bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
${BENCHMARK_PATH}/deepvariant.sh ${BAM} 
