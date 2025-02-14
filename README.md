# Complete Genomics Benchmarks 

*THIS PAGE IS UNDER CONSTRUCTION*

## Getting started 

Clone the repo and set the environment variable `NVME_DIR=/path/to/local/ssd`. Parabricks benchmarks run best when run on a fast SSD that is local to the machine (not network storage). 

### Software Dependencies 

`sudo apt install -y tabix bwa`

### Downloading data 

`download.sh` downloads all the necessary fastqs and reference files.  

### Downsample the data 

`downsample.sh` will downsample all the data to have the same coverage (30x). 

### Benchmark the data 

`benchmark.sh [hardware]` is where the benchmarking scripts (located in `benchmarks` and separated by GPU hardware) are called. 

### Moving data to fast local SSD 

`utils/move_data.sh` is a template for how to move selected files from `data` to `NVME_DIR`.  

This is only necessary if data is ever wiped from the local SSD. For example, after stopping an EC2 instance on AWS. 