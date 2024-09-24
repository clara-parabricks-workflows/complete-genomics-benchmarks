#!/bin/bash

# Sync the downloaded and pre-processed data with S3 bucket

DATA_DIR="/opt/dlami/nvme/data"
mkdir -p ${DATA_DIR}

# Upload 
# aws s3 sync ${DATA_DIR} s3://complete-genomics-benchmarking-data/

# Download 
aws s3 sync s3://complete-genomics-benchmarking-data/ ${DATA_DIR}
