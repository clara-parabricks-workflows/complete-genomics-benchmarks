#!/bin/bash 

# T1 Plus 

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

mkdir -p ${NVME_DIR}/data/ref

# Move reference files 
echo "Moving reference files"
REF_DIR="/home/ubuntu/complete-genomics-benchmarks/data/ref"

rsync -ah --progress ${REF_DIR}/ucsc.* ${NVME_DIR}/data/ref
rsync -ah --progress ${REF_DIR}/dbsnp_151.vcf.gz ${NVME_DIR}/data/ref
rsync -ah --progress ${REF_DIR}/dbsnp_151.vcf.gz.tbi ${NVME_DIR}/data/ref
rsync -ah --progress ${REF_DIR}/1000G_phase1.indels.hg19.sites.vcf.gz ${NVME_DIR}/data/ref
rsync -ah --progress ${REF_DIR}/1000G_phase1.indels.hg19.sites.vcf.idx ${NVME_DIR}/data/ref
rsync -ah --progress ${REF_DIR}/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz ${NVME_DIR}/data/ref
rsync -ah --progress ${REF_DIR}/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.idx ${NVME_DIR}/data/ref

# Move data files 
echo "Moving data files"
DATA_DIR="/home/ubuntu/complete-genomics-benchmarks/data"

rsync -ah --progress ${DATA_DIR}/DL100002760_L01_read_1.fq.gz ${NVME_DIR}/data 
rsync -ah --progress ${DATA_DIR}/DL100002760_L01_read_2.fq.gz ${NVME_DIR}/data