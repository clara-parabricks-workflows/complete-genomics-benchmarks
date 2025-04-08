#!/bin/bash

# Download the data and reference files 
# ./download.sh 

# Downsample the T7 data from 46x coverage down to 30x 
./downsample.sh E100030471QC960_L01_48_1.fq.gz 0.65
./downsample.sh E100030471QC960_L01_48_2.fq.gz 0.65

# Run benchmarks 
# ./benchmark.sh L4