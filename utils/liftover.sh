#!/bin/bash 

# Sources:
# https://github.com/broadinstitute/picard/releases/download/2.27.5/picard.jar
# https://github.com/broadgsa/gatk/blob/master/public/chainFiles/b37tohg19.chain

# LiftOver VCF

# ROOT_DIR="/home/ubuntu/complete-genomics-benchmarks"
# PICARD_PATH="${ROOT_DIR}/picard.jar"

# REF="${ROOT_DIR}/data/ref/ucsc.hg19.fasta"
# IN_VCF="${ROOT_DIR}/data/HG001_GRCh37_1_22_v4.2.1_benchmark.vcf"
# LIFTOVER_VCF="${ROOT_DIR}/data/HG001_ucsc_hg19_1_22_v4.2.1_benchmark.vcf"

# CHAIN="${ROOT_DIR}/b37tohg19.chain"
# REJECTED_VCF="${ROOT_DIR}/rejected_variants.vcf"

# java -jar ${PICARD_PATH} LiftoverVcf \
#     -I ${IN_VCF} \
#     -O ${LIFTOVER_VCF} \
#     -CHAIN ${CHAIN} \
#     -REJECT ${REJECTED_VCF} \
#     -R ${REF}

# LiftOver Bed

# Source: https://genome.sph.umich.edu/wiki/LiftOver

ROOT_DIR="/home/ubuntu/complete-genomics-benchmarks"
INPUT_BED="${ROOT_DIR}/data/HG001_GRCh37_1_22_v4.2.1_benchmark.bed"
CHAIN_FILE="${ROOT_DIR}/b37tohg19.chain"
OUTPUT_BED="${ROOT_DIR}/data/HG001_ucsc_hg19_1_22_v4.2.1_benchmark.bed"
UNLIFTED_BED="${ROOT_DIR}/data/unlifted.bed"

liftOver ${INPUT_BED} ${CHAIN_FILE} ${OUTPUT_BED} ${UNLIFTED_BED}