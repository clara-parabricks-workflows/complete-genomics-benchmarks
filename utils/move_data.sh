#!/bin/bash 

# T1 Plus 

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

mkdir -p ${NVME_DIR}/data/ref

# Move ref
echo "Moving reference files"
rsync -ah --progress ../data/ref/ucsc.* ${NVME_DIR}/data/ref

# Move data
echo "Moving data files"
rsync -ah --progress ../data/DL100002760_L01_read_1.fq.gz ${NVME_DIR}/data 
rsync -ah --progress ../data/DL100002760_L01_read_2.fq.gz ${NVME_DIR}/data 