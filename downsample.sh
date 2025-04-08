#!/bin/bash

SAMPLE_NAME="$(basename -s .fq.gz $1)"
DOWNSAMPLE_FRAC="$2"

# Pigz is like gzip but multi-threaded 
pigz -d data/"${SAMPLE_NAME}.fq.gz"
seqtk sample -s100 "data/${SAMPLE_NAME}.fq" ${DOWNSAMPLE_FRAC} > data/${SAMPLE_NAME}.30x.fq
pigz data/${SAMPLE_NAME}.30x.fq