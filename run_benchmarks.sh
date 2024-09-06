#!/bin/bash

mkdir -p outdir
mkdir -p logs 

BENCHMARK_PATH="./benchmarks/L4/"

# ============================================================

# Sample T7 - WGS
FASTQ_1="E100030471QC960_L01_48_1_33x.fq.gz"
FASTQ_2="E100030471QC960_L01_48_2_33x.fq.gz"
BAM="E100030471QC960_L01_48_1_33x.bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
# ${BENCHMARK_PATH}/deepvariant.sh ${BAM} 

# ============================================================

# Sample T7 - WES
FASTQ_1="T7_PE150_NA12878_WES_sample4_1.fq.gz"
FASTQ_2="T7_PE150_NA12878_WES_sample4_2.fq.gz"
BAM="T7_PE150_NA12878_WES_sample4_1.bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
# ${BENCHMARK_PATH}/deepvariant.sh ${BAM} "--use-wes-model"

# ============================================================

# Sample G400 - WES
FASTQ_1="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz"
FASTQ_2="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz"
BAM="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
# ${BENCHMARK_PATH}/deepvariant.sh ${BAM} 

# ============================================================

# Sample G400 - WGS
FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1_33x.fq.gz"
FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2_33x.fq.gz"
BAM="G400_PE150_NA12878_WGS_V300046476_L01_1_33x.bam"

${BENCHMARK_PATH}/germline.sh ${FASTQ_1} ${FASTQ_2} 
# ${BENCHMARK_PATH}/deepvariant.sh ${BAM} "--use-wes-model"
