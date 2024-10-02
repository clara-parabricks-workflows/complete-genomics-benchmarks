#!/bin/bash 

GATK_CONTAINER="broadinstitute/gatk:latest"
DATA_DIR="/home/ubuntu/complete-genomics-benchmarks/data"
EVAL_VCF="$1"
TRUTH_VCF="HG001_GRCh37_1_22_v4.2.1_benchmark.withChr.vcf.gz"
SUMMARY_TSV="$(basename -s .vcf $EVAL_VCF).tsv"

docker run --rm \
    -v ${DATA_DIR}:/data \
    ${GATK_CONTAINER} \
    gatk Concordance \
    -R /data/ref/ucsc.hg19.fasta \
    -eval /data/${EVAL_VCF} \
    --truth /data/${TRUTH_VCF} \
    --summary /data/${SUMMARY_TSV} 