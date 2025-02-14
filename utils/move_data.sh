#!/bin/bash 

# Note: Run script from project home dir 

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

mkdir -p $NVME_DIR/data/ref
rsync -ah --progress data $NVME_DIR