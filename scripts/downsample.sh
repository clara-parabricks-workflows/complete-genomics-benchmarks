#!/bin/bash

SAMPLE_NAME="$(basename -s .fq.gz $1)"
DOWNSAMPLE_FRAC="$2"

gunzip data/"${SAMPLE_NAME}.fq.gz"
seqtk sample -s100 "data/${SAMPLE_NAME}.fq" ${DOWNSAMPLE_FRAC} > data/${SAMPLE_NAME}.33x.fq
rm "data/${SAMPLE_NAME}.fq"
gzip data/${SAMPLE_NAME}.33x.fq