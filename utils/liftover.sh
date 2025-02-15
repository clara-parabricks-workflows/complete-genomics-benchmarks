#!/bin/bash 

# The truth VCFs are referenced using GRCh37 but our data uses hg19 

PROJECT_DIR="$PWD"
DATA_DIR=$PROJECT_DIR/data
TRUTH_DIR=$DATA_DIR/truth

# LiftOver the Truth VCF
PICARD_PATH="$PROJECT_DIR/picard.jar"
CHAIN="$PROJECT_DIR/b37tohg19.chain"

REF="$DATA_DIR/ref/ucsc.hg19.fasta"
IN_VCF="$TRUTH_DIR/HG001_GRCh37_1_22_v4.2.1_benchmark.vcf.gz"
LIFTOVER_VCF="$TRUTH_DIR/HG001_ucsc_hg19_1_22_v4.2.1_benchmark.vcf.gz"

REJECTED_VCF="$TRUTH_DIR/rejected_variants.vcf"

java -jar ${PICARD_PATH} LiftoverVcf \
    -I ${IN_VCF} \
    -O ${LIFTOVER_VCF} \
    -CHAIN ${CHAIN} \
    -REJECT ${REJECTED_VCF} \
    -R ${REF}

# LiftOver Bed
# Source: https://genome.sph.umich.edu/wiki/LiftOver
CHAIN_FILE="${PROJECT_DIR}/b37tohg19.chain"
INPUT_BED="${TRUTH_DIR}/HG001_GRCh37_1_22_v4.2.1_benchmark.bed"
OUTPUT_BED="${TRUTH_DIR}/HG001_ucsc_hg19_1_22_v4.2.1_benchmark.bed"
UNLIFTED_BED="${TRUTH_DIR}/unlifted.bed"

./liftOver ${INPUT_BED} ${CHAIN_FILE} ${OUTPUT_BED} ${UNLIFTED_BED}