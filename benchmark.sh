#!/bin/bash

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

# Check that the hardware is set 
if [[ -z $1 ]]; then
    echo "Missing hardware setting. Exiting."
    echo "./benchmark.sh L4"
    exit
fi

HARDWARE="$1"
BENCHMARK_PATH="./benchmarks/${HARDWARE}"

mkdir -p ${NVME_DIR}/tmp
mkdir -p ${NVME_DIR}/data/logs
mkdir -p ${NVME_DIR}/data/outdir

# Define samples 
declare -a T1Plus_samples=(30x_DL100002760_L01_NA12878_1.fq.gz 30x_DL100002760_L01_NA12878_2.fq.gz)
declare -a T7_samples=(E100030471QC960_L01_48_1.30x.fq.gz E100030471QC960_L01_48_2.30x.fq.gz)
declare -a G400_samples=(G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz)

# Note: Array contents must match names declared above 
declare -a all_samples=("T1Plus_samples" "T7_samples" "G400_samples")

# Run benchmarks on every set of samples 
for s in "${all_samples[@]}"; do
    
    # Let's us treat all_samples like a 2D array 
    declare -n sample="$s"

    # Run germline benchmark 
    ${BENCHMARK_PATH}/germline.sh ${sample[0]} ${sample[1]}
   
    # Run deepvariant benchmark 
    BAM="$(basename -s .fq.gz ${sample[0]}).bam"
    ${BENCHMARK_PATH}/deepvariant.sh ${BAM}

done

