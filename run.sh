#!/bin/bash

# Download the data and reference files 
# ./download.sh 

# Downsample the T7 data from 46x coverage down to 30x 
./downsample.sh E100030471QC960_L01_48_1.fq.gz 0.65
./downsample.sh E100030471QC960_L01_48_2.fq.gz 0.65

# Move data to NVME
NVME_DIR=/opt/dlami/nvme
rsync -ah --progress data $NVME_DIR

# Run benchmarks
./benchmark.sh $NVME_DIR L4

# Move data back to home dir 
rsync -ah --progress $NVME_DIR/data .