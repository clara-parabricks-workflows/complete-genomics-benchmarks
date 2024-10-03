#!/bin/bash 

# Option 1: Using hap.py

DATA_DIR="/home/ubuntu/complete-genomics-benchmarks/data"
EVAL_VCF="$1"
TRUTH_VCF="$2"
TRUTH_BED="$3"
OUT_FILE="$(basename -s .vcf $EVAL_VCF).output"

docker run \
    -v ${DATA_DIR}:/data \
    jmcdani20/hap.py:v0.3.12 /opt/hap.py/bin/hap.py \
    /data/${TRUTH_VCF} \
    /data/${EVAL_VCF} \
    -f /data/${TRUTH_BED} \
    -r /data/ref/ucsc.hg19.fasta \
    -o /data/${OUT_FILE} \
    --engine=vcfeval \
    --pass-only

# Option 2: Using GATK Concordance 

# GATK_CONTAINER="broadinstitute/gatk:latest"
# DATA_DIR="/home/ubuntu/complete-genomics-benchmarks/data"
# EVAL_VCF="$1"
# TRUTH_VCF="$2"
# SUMMARY_TSV="$(basename -s .vcf $EVAL_VCF).tsv"

# docker run --rm \
#     -v ${DATA_DIR}:/data \
#     ${GATK_CONTAINER} \
#     gatk Concordance \
#     -R /data/ref/ucsc.hg19.fasta \
#     -eval /data/${EVAL_VCF} \
#     --truth /data/${TRUTH_VCF} \
#     --summary /data/${SUMMARY_TSV} 