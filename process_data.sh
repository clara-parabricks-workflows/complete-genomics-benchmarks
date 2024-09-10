#!/bin/bash 

# 1. Run bammetrics to get original coverage 

G400_WGS_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
G400_WGS_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
./scripts/fq2bamfast.sh ${G400_WGS_FASTQ_1} ${G400_WGS_FASTQ_2} 
./scripts/bammetrics.sh $(basename -s .fq.gz $G400_WGS_FASTQ_1).bam

T7_WGS_FASTQ_1="E100030471QC960_L01_48_1.fq.gz"
T7_WGS_FASTQ_2="E100030471QC960_L01_48_2.fq.gz"
./scripts/fq2bamfast.sh ${T7_WGS_FASTQ_1} ${T7_WGS_FASTQ_2} 
./scripts/bammetrics.sh $(basename -s .fq.gz $T7_WGS_FASTQ_1).bam

G400_WES_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
G400_WES_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
./scripts/fq2bamfast.sh ${G400_WES_FASTQ_1} ${G400_WES_FASTQ_2}
./scripts/bammetrics.sh $(basename -s .fq.gz $G400_WES_FASTQ_1).bam

T7_WES_FASTQ_1="E100030471QC960_L01_48_1.fq.gz"
T7_WES_FASTQ_2="E100030471QC960_L01_48_2.fq.gz"
./scripts/fq2bamfast.sh ${T7_WES_FASTQ_1} ${T7_WES_FASTQ_2}
./scripts/bammetrics.sh $(basename -s .fq.gz $T7_WES_FASTQ_1).bam

# 2. Run bamstats to get number of reads 

./scripts/bamstats.sh $(basename -s .fq.gz $G400_WGS_FASTQ_1).bam
./scripts/bamstats.sh $(basename -s .fq.gz $T7_WGS_FASTQ_1).bam

./scripts/bamstats.sh $(basename -s .fq.gz $G400_WES_FASTQ_1).bam
./scripts/bamstats.sh $(basename -s .fq.gz $T7_WES_FASTQ_1).bam

# 3. Downsample data to 33x based on coverage from bammetrics 

# ./scripts/downsample.sh ${G400_FASTQ_1} 0.75
# ./scripts/downsample.sh ${G400_FASTQ_2} 0.75
# ./scripts/downsample.sh ${T7_FASTQ_1} 0.75
# ./scripts/downsample.sh ${T7_FASTQ_2} 0.75 

# 4. Run bammetrics on downsample data 

# ./scripts/bammetrics.sh $(basename -s .fq.gz $G400_FASTQ_1).33x.bam
# ./scripts/bammetrics.sh $(basename -s .fq.gz $T7_FASTQ_1).33x.bam

# 5. Run bamstats on downsampled data

# ./scripts/bamstats.sh $(basename -s .fq.gz $G400_FASTQ_1).33x.bam
# ./scripts/bamstats.sh $(basename -s .fq.gz $T7_FASTQ_1).33x.bam
