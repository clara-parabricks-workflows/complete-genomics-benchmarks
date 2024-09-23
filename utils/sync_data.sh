#!/bin/bash

# Sync the downloaded and pre-processed data with S3 bucket

# Upload 
# aws s3 sync ../data s3://complete-genomics-benchmarking-data/

# Download 
aws s3 sync s3://complete-genomics-benchmarking-data/ ../data

