#!/bin/bash

# Sync the downloaded and pre-processed data with S3 bucket
aws s3 sync ../data s3://complete-genomics-benchmarking-data/
