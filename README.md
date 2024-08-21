# Complete Genomics Benchmarks 

## Software Requirements 

[seqtk](https://github.com/lh3/seqtk)

```
git clone https://github.com/lh3/seqtk.git;
cd seqtk; make
```

## Download the data 

```
download_data.sh 
```

## Downsample the data to 33x 

```
downsample_wgs_data.sh 
```

## AWS Instances 

```
4 L4 - g6.24xlarge 
4 H100 - p5.48xlarge (need to specify only 4 GPUs)
```